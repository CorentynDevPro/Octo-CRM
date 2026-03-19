-- ============================================================
-- SAVED REPORTS
-- ============================================================
CREATE TABLE reports (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID         NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    created_by_id   UUID         REFERENCES users(id) ON DELETE SET NULL,
    name            VARCHAR(255) NOT NULL,
    description     TEXT,
    report_type     VARCHAR(50)  NOT NULL,
    config          JSONB        NOT NULL DEFAULT '{}',
    is_public       BOOLEAN      NOT NULL DEFAULT FALSE,
    schedule        JSONB,
    last_run_at     TIMESTAMPTZ,
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    deleted_at      TIMESTAMPTZ
);

CREATE INDEX idx_reports_org ON reports (organization_id) WHERE deleted_at IS NULL;
