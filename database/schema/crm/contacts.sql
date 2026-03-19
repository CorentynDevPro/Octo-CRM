-- ============================================================
-- CONTACTS
-- ============================================================
CREATE TABLE contacts (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID         NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    owner_id        UUID         REFERENCES users(id) ON DELETE SET NULL,
    lead_id         UUID         REFERENCES leads(id) ON DELETE SET NULL,
    first_name      VARCHAR(100) NOT NULL,
    last_name       VARCHAR(100) NOT NULL,
    email           VARCHAR(320),
    phone           VARCHAR(30),
    company         VARCHAR(255),
    job_title       VARCHAR(255),
    website         VARCHAR(512),
    address         JSONB        NOT NULL DEFAULT '{}',
    social_links    JSONB        NOT NULL DEFAULT '{}',
    custom_fields   JSONB        NOT NULL DEFAULT '{}',
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    created_by_id   UUID         REFERENCES users(id),
    updated_by_id   UUID         REFERENCES users(id),
    deleted_at      TIMESTAMPTZ
);

CREATE INDEX idx_contacts_org   ON contacts (organization_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_contacts_owner ON contacts (owner_id)        WHERE deleted_at IS NULL;
CREATE INDEX idx_contacts_email ON contacts (email)           WHERE email IS NOT NULL;
CREATE INDEX idx_contacts_lead  ON contacts (lead_id)         WHERE lead_id IS NOT NULL;
