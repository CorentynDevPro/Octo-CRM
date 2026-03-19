-- Sample organizations
INSERT INTO organizations (id, name, slug, plan) VALUES
    ('00000000-0000-0000-0000-000000000001', 'Acme Corp',    'acme-corp',    'enterprise'),
    ('00000000-0000-0000-0000-000000000002', 'Beta Company', 'beta-company', 'pro')
ON CONFLICT (slug) DO NOTHING;
