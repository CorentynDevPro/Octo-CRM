-- ============================================================
-- ORGANIZATIONS
-- Core multi-tenant table — every row in the system belongs
-- to an organization via organization_id.
-- ============================================================
CREATE TABLE organizations (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name          VARCHAR(255)  NOT NULL,
    slug          VARCHAR(255)  NOT NULL UNIQUE,
    domain        VARCHAR(255),
    logo_url      TEXT,
    plan          VARCHAR(50)   NOT NULL DEFAULT 'free',
    is_active     BOOLEAN       NOT NULL DEFAULT TRUE,
    settings      JSONB         NOT NULL DEFAULT '{}',
    created_at    TIMESTAMPTZ   NOT NULL DEFAULT NOW(),
    updated_at    TIMESTAMPTZ   NOT NULL DEFAULT NOW(),
    deleted_at    TIMESTAMPTZ
);

CREATE INDEX idx_organizations_slug     ON organizations (slug);
CREATE INDEX idx_organizations_domain   ON organizations (domain) WHERE domain IS NOT NULL;
CREATE INDEX idx_organizations_active   ON organizations (is_active) WHERE deleted_at IS NULL;
