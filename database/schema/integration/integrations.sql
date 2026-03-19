-- ============================================================
-- EXTERNAL INTEGRATIONS
-- ============================================================
CREATE TABLE integrations (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID         NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    provider        VARCHAR(100) NOT NULL, -- salesforce, hubspot, stripe, slack, etc.
    name            VARCHAR(255) NOT NULL,
    status          VARCHAR(50)  NOT NULL DEFAULT 'INACTIVE',
    config          JSONB        NOT NULL DEFAULT '{}',
    credentials     JSONB        NOT NULL DEFAULT '{}', -- encrypted at application level
    last_sync_at    TIMESTAMPTZ,
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    CONSTRAINT uq_integrations UNIQUE (organization_id, provider)
);

CREATE TABLE webhooks (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID         NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    name            VARCHAR(255) NOT NULL,
    url             TEXT         NOT NULL,
    events          JSONB        NOT NULL DEFAULT '[]',
    secret          TEXT,
    is_active       BOOLEAN      NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE TABLE webhook_deliveries (
    id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    webhook_id   UUID        NOT NULL REFERENCES webhooks(id) ON DELETE CASCADE,
    event_name   VARCHAR(100) NOT NULL,
    payload      JSONB        NOT NULL DEFAULT '{}',
    status_code  SMALLINT,
    response     TEXT,
    duration_ms  INTEGER,
    delivered_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_integrations_org     ON integrations (organization_id);
CREATE INDEX idx_webhooks_org         ON webhooks (organization_id);
CREATE INDEX idx_webhook_deliveries   ON webhook_deliveries (webhook_id, delivered_at DESC);
