-- ============================================================
-- SUBSCRIPTIONS
-- ============================================================
CREATE TABLE subscription_plans (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name          VARCHAR(100)   NOT NULL UNIQUE,
    description   TEXT,
    price         NUMERIC(10, 2) NOT NULL,
    currency      CHAR(3)        NOT NULL DEFAULT 'USD',
    interval      VARCHAR(20)    NOT NULL DEFAULT 'month',
    max_users     INTEGER,
    features      JSONB          NOT NULL DEFAULT '[]',
    is_active     BOOLEAN        NOT NULL DEFAULT TRUE,
    created_at    TIMESTAMPTZ    NOT NULL DEFAULT NOW(),
    updated_at    TIMESTAMPTZ    NOT NULL DEFAULT NOW()
);

CREATE TABLE subscriptions (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID         NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    plan_id         UUID         NOT NULL REFERENCES subscription_plans(id),
    status          VARCHAR(50)  NOT NULL DEFAULT 'ACTIVE',
    current_period_start TIMESTAMPTZ NOT NULL,
    current_period_end   TIMESTAMPTZ NOT NULL,
    cancel_at       TIMESTAMPTZ,
    cancelled_at    TIMESTAMPTZ,
    external_id     VARCHAR(255),
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_subscriptions_org    ON subscriptions (organization_id);
CREATE INDEX idx_subscriptions_status ON subscriptions (status);
