-- ============================================================
-- TRIGGER: write audit log on UPDATE / DELETE
-- ============================================================
CREATE OR REPLACE FUNCTION trigger_audit_log()
RETURNS TRIGGER AS $$
DECLARE
    v_action     TEXT;
    v_old_values JSONB;
    v_new_values JSONB;
BEGIN
    IF TG_OP = 'DELETE' THEN
        v_action := 'DELETE';
        v_old_values := to_jsonb(OLD);
        v_new_values := NULL;
    ELSIF TG_OP = 'UPDATE' THEN
        v_action := 'UPDATE';
        v_old_values := to_jsonb(OLD);
        v_new_values := to_jsonb(NEW);
    ELSIF TG_OP = 'INSERT' THEN
        v_action := 'CREATE';
        v_old_values := NULL;
        v_new_values := to_jsonb(NEW);
    END IF;

    INSERT INTO audit_logs (
        organization_id, action, resource_type, resource_id,
        old_values, new_values
    )
    VALUES (
        COALESCE(
            (v_new_values->>'organization_id')::UUID,
            (v_old_values->>'organization_id')::UUID
        ),
        v_action,
        TG_TABLE_NAME,
        COALESCE(
            (v_new_values->>'id')::UUID,
            (v_old_values->>'id')::UUID
        ),
        v_old_values,
        v_new_values
    );

    RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;
