-- Sample users (password: 'Password1!' hashed with bcrypt)
INSERT INTO users (id, organization_id, email, password_hash, first_name, last_name, role, status, email_verified_at) VALUES
    ('00000000-0000-0000-0001-000000000001', '00000000-0000-0000-0000-000000000001',
     'admin@acme.com', '$2b$12$placeholder_hash', 'Alice', 'Admin', 'SUPER_ADMIN', 'ACTIVE', NOW()),
    ('00000000-0000-0000-0001-000000000002', '00000000-0000-0000-0000-000000000001',
     'sales@acme.com', '$2b$12$placeholder_hash', 'Bob', 'Sales', 'SALES_REP', 'ACTIVE', NOW())
ON CONFLICT ON CONSTRAINT uq_users_email_org DO NOTHING;
