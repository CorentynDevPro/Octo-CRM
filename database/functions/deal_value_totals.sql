-- ============================================================
-- FUNCTION: get deal totals for an organization
-- ============================================================
CREATE OR REPLACE FUNCTION get_deal_totals(p_organization_id UUID)
RETURNS TABLE (
    status        TEXT,
    deal_count    BIGINT,
    total_value   NUMERIC,
    avg_value     NUMERIC
)
LANGUAGE SQL STABLE AS $$
    SELECT
        status::TEXT,
        COUNT(*)         AS deal_count,
        SUM(value)       AS total_value,
        AVG(value)       AS avg_value
    FROM deals
    WHERE organization_id = p_organization_id
      AND deleted_at IS NULL
    GROUP BY status;
$$;
