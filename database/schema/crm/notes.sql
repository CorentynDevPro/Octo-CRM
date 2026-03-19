-- ============================================================
-- NOTES — rich-text notes attached to any CRM entity
-- ============================================================
CREATE TABLE notes (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID        NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    author_id       UUID        REFERENCES users(id) ON DELETE SET NULL,
    related_type    VARCHAR(50) NOT NULL, -- lead, contact, deal
    related_id      UUID        NOT NULL,
    body            TEXT        NOT NULL,
    is_pinned       BOOLEAN     NOT NULL DEFAULT FALSE,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    deleted_at      TIMESTAMPTZ
);

CREATE INDEX idx_notes_related ON notes (related_type, related_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_notes_author  ON notes (author_id)                WHERE deleted_at IS NULL;
