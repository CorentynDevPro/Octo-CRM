-- ============================================================
-- VIEW: flattened user permissions
-- ============================================================
CREATE OR REPLACE VIEW v_user_permissions AS
SELECT
    u.id   AS user_id,
    u.organization_id,
    p.resource,
    p.action,
    p.resource || ':' || p.action AS permission
FROM users           u
JOIN user_roles      ur ON ur.user_id = u.id
JOIN role_permissions rp ON rp.role_id = ur.role_id
JOIN permissions     p  ON p.id = rp.permission_id
WHERE u.deleted_at IS NULL;
