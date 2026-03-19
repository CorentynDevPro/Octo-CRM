-- ============================================================
-- FILE ATTACHMENTS
-- ============================================================
CREATE TABLE files (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID         NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    uploaded_by_id  UUID         REFERENCES users(id) ON DELETE SET NULL,
    filename        VARCHAR(512) NOT NULL,
    original_name   VARCHAR(512) NOT NULL,
    mime_type       VARCHAR(100) NOT NULL,
    size_bytes      BIGINT       NOT NULL,
    storage_key     TEXT         NOT NULL UNIQUE,
    storage_bucket  VARCHAR(255) NOT NULL,
    is_public       BOOLEAN      NOT NULL DEFAULT FALSE,
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE TABLE entity_files (
    file_id      UUID        NOT NULL REFERENCES files(id) ON DELETE CASCADE,
    entity_type  VARCHAR(50) NOT NULL,
    entity_id    UUID        NOT NULL,
    PRIMARY KEY (file_id, entity_type, entity_id)
);

CREATE INDEX idx_files_org         ON files (organization_id);
CREATE INDEX idx_entity_files      ON entity_files (entity_type, entity_id);
