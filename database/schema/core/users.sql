-- ============================================================
-- USERS
-- ============================================================
CREATE TABLE users (
    id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id   UUID          NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    email             VARCHAR(320)  NOT NULL,
    password_hash     TEXT          NOT NULL,
    first_name        VARCHAR(100)  NOT NULL,
    last_name         VARCHAR(100)  NOT NULL,
    phone             VARCHAR(30),
    avatar_url        TEXT,
    role              VARCHAR(50)   NOT NULL DEFAULT 'VIEWER',
    status            VARCHAR(50)   NOT NULL DEFAULT 'PENDING',
    last_login_at     TIMESTAMPTZ,
    email_verified_at TIMESTAMPTZ,
    settings          JSONB         NOT NULL DEFAULT '{}',
    created_at        TIMESTAMPTZ   NOT NULL DEFAULT NOW(),
    updated_at        TIMESTAMPTZ   NOT NULL DEFAULT NOW(),
    created_by_id     UUID,
    updated_by_id     UUID,
    deleted_at        TIMESTAMPTZ,
    CONSTRAINT uq_users_email_org UNIQUE (organization_id, email)
);

CREATE INDEX idx_users_org        ON users (organization_id);
CREATE INDEX idx_users_email      ON users (email);
CREATE INDEX idx_users_status     ON users (status) WHERE deleted_at IS NULL;
CREATE INDEX idx_users_role       ON users (role)   WHERE deleted_at IS NULL;
