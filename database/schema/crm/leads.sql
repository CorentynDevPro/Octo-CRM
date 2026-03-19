-- ============================================================
-- LEADS
-- ============================================================
CREATE TABLE leads (
    id                    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id       UUID         NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    owner_id              UUID         REFERENCES users(id) ON DELETE SET NULL,
    first_name            VARCHAR(100) NOT NULL,
    last_name             VARCHAR(100) NOT NULL,
    email                 VARCHAR(320),
    phone                 VARCHAR(30),
    company               VARCHAR(255),
    job_title             VARCHAR(255),
    website               VARCHAR(512),
    status                VARCHAR(50)  NOT NULL DEFAULT 'NEW',
    source                VARCHAR(100),
    score                 SMALLINT     NOT NULL DEFAULT 0,
    converted_at          TIMESTAMPTZ,
    converted_to_contact_id UUID       REFERENCES contacts(id) ON DELETE SET NULL,
    notes                 TEXT,
    custom_fields         JSONB        NOT NULL DEFAULT '{}',
    created_at            TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at            TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    created_by_id         UUID         REFERENCES users(id),
    updated_by_id         UUID         REFERENCES users(id),
    deleted_at            TIMESTAMPTZ
);

CREATE INDEX idx_leads_org       ON leads (organization_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_leads_owner     ON leads (owner_id)        WHERE deleted_at IS NULL;
CREATE INDEX idx_leads_status    ON leads (status)          WHERE deleted_at IS NULL;
CREATE INDEX idx_leads_email     ON leads (email)           WHERE email IS NOT NULL;
CREATE INDEX idx_leads_score     ON leads (score DESC)      WHERE deleted_at IS NULL;
CREATE INDEX idx_leads_created   ON leads (created_at DESC);
