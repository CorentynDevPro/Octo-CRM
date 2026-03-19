-- ============================================================
-- PIPELINES & STAGES
-- ============================================================
CREATE TABLE pipelines (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID         NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    name            VARCHAR(255) NOT NULL,
    is_default      BOOLEAN      NOT NULL DEFAULT FALSE,
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    deleted_at      TIMESTAMPTZ
);

CREATE TABLE stages (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    pipeline_id UUID         NOT NULL REFERENCES pipelines(id) ON DELETE CASCADE,
    name        VARCHAR(255) NOT NULL,
    stage_order SMALLINT     NOT NULL,
    probability SMALLINT     NOT NULL DEFAULT 0 CHECK (probability BETWEEN 0 AND 100),
    color       VARCHAR(7),
    created_at  TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at  TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_pipelines_org ON pipelines (organization_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_stages_pipeline ON stages (pipeline_id, stage_order);
