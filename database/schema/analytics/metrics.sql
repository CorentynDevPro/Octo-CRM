-- ============================================================
-- METRICS — pre-aggregated business metrics
-- ============================================================
CREATE TABLE metrics (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID         NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    metric_name     VARCHAR(100) NOT NULL,
    metric_value    NUMERIC      NOT NULL,
    dimensions      JSONB        NOT NULL DEFAULT '{}',
    period_start    DATE         NOT NULL,
    period_end      DATE         NOT NULL,
    computed_at     TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    CONSTRAINT uq_metrics UNIQUE (organization_id, metric_name, dimensions, period_start)
);

CREATE INDEX idx_metrics_org    ON metrics (organization_id, metric_name, period_start DESC);
