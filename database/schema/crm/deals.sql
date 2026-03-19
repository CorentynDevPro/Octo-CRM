-- ============================================================
-- DEALS
-- ============================================================
CREATE TABLE deals (
    id                   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id      UUID           NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    pipeline_id          UUID           NOT NULL REFERENCES pipelines(id),
    stage_id             UUID           NOT NULL REFERENCES stages(id),
    owner_id             UUID           REFERENCES users(id) ON DELETE SET NULL,
    contact_id           UUID           REFERENCES contacts(id) ON DELETE SET NULL,
    title                VARCHAR(255)   NOT NULL,
    value                NUMERIC(15, 2) NOT NULL DEFAULT 0,
    currency             CHAR(3)        NOT NULL DEFAULT 'USD',
    status               VARCHAR(50)    NOT NULL DEFAULT 'OPEN',
    probability          SMALLINT       NOT NULL DEFAULT 0,
    expected_close_date  DATE,
    closed_at            TIMESTAMPTZ,
    lost_reason          TEXT,
    custom_fields        JSONB          NOT NULL DEFAULT '{}',
    created_at           TIMESTAMPTZ    NOT NULL DEFAULT NOW(),
    updated_at           TIMESTAMPTZ    NOT NULL DEFAULT NOW(),
    created_by_id        UUID           REFERENCES users(id),
    updated_by_id        UUID           REFERENCES users(id),
    deleted_at           TIMESTAMPTZ
);

CREATE INDEX idx_deals_org      ON deals (organization_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_deals_pipeline ON deals (pipeline_id)     WHERE deleted_at IS NULL;
CREATE INDEX idx_deals_stage    ON deals (stage_id)        WHERE deleted_at IS NULL;
CREATE INDEX idx_deals_owner    ON deals (owner_id)        WHERE deleted_at IS NULL;
CREATE INDEX idx_deals_status   ON deals (status)          WHERE deleted_at IS NULL;
CREATE INDEX idx_deals_value    ON deals (value DESC)      WHERE deleted_at IS NULL;
CREATE INDEX idx_deals_close    ON deals (expected_close_date) WHERE expected_close_date IS NOT NULL;
