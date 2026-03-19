-- ============================================================
-- SETTINGS — key-value configuration per organization
-- ============================================================
CREATE TABLE settings (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID         NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    key             VARCHAR(255) NOT NULL,
    value           JSONB        NOT NULL DEFAULT '{}',
    updated_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    CONSTRAINT uq_settings_key_org UNIQUE (organization_id, key)
);

CREATE INDEX idx_settings_org ON settings (organization_id);
