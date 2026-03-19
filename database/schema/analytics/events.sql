-- ============================================================
-- ANALYTICS EVENTS — immutable event log
-- ============================================================
CREATE TABLE analytics_events (
    id              UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID        NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    user_id         UUID        REFERENCES users(id) ON DELETE SET NULL,
    session_id      UUID,
    event_name      VARCHAR(100) NOT NULL,
    event_category  VARCHAR(100),
    properties      JSONB        NOT NULL DEFAULT '{}',
    ip_address      INET,
    user_agent      TEXT,
    occurred_at     TIMESTAMPTZ  NOT NULL DEFAULT NOW()
) PARTITION BY RANGE (occurred_at);

-- Monthly partitions example (create as needed)
-- CREATE TABLE analytics_events_2025_01 PARTITION OF analytics_events
--   FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');

CREATE INDEX idx_events_org      ON analytics_events (organization_id, occurred_at DESC);
CREATE INDEX idx_events_name     ON analytics_events (event_name, occurred_at DESC);
CREATE INDEX idx_events_user     ON analytics_events (user_id, occurred_at DESC) WHERE user_id IS NOT NULL;
