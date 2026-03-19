-- ============================================================
-- TAGS — flexible tagging for any CRM entity
-- ============================================================
CREATE TABLE tags (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID         NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    name            VARCHAR(100) NOT NULL,
    color           VARCHAR(7),
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    CONSTRAINT uq_tags_name_org UNIQUE (organization_id, name)
);

CREATE TABLE entity_tags (
    tag_id       UUID        NOT NULL REFERENCES tags(id) ON DELETE CASCADE,
    entity_type  VARCHAR(50) NOT NULL, -- lead, contact, deal
    entity_id    UUID        NOT NULL,
    PRIMARY KEY (tag_id, entity_type, entity_id)
);

CREATE INDEX idx_entity_tags_entity ON entity_tags (entity_type, entity_id);
