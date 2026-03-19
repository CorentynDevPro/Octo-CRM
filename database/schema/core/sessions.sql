-- ============================================================
-- SESSIONS & REFRESH TOKENS
-- ============================================================
CREATE TABLE sessions (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         UUID         NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    refresh_token   TEXT         NOT NULL UNIQUE,
    ip_address      INET,
    user_agent      TEXT,
    expires_at      TIMESTAMPTZ  NOT NULL,
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    revoked_at      TIMESTAMPTZ
);

CREATE INDEX idx_sessions_user      ON sessions (user_id);
CREATE INDEX idx_sessions_token     ON sessions (refresh_token);
CREATE INDEX idx_sessions_expires   ON sessions (expires_at) WHERE revoked_at IS NULL;
