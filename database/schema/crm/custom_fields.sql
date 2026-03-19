-- ============================================================
-- CUSTOM FIELDS — dynamic fields per entity type
-- ============================================================
CREATE TABLE custom_field_definitions (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID         NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    entity_type     VARCHAR(50)  NOT NULL, -- lead, contact, deal
    field_key       VARCHAR(100) NOT NULL,
    label           VARCHAR(255) NOT NULL,
    field_type      VARCHAR(50)  NOT NULL, -- text, number, date, boolean, select, multi_select
    is_required     BOOLEAN      NOT NULL DEFAULT FALSE,
    options         JSONB,
    field_order     SMALLINT     NOT NULL DEFAULT 0,
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    CONSTRAINT uq_custom_fields UNIQUE (organization_id, entity_type, field_key)
);

CREATE INDEX idx_custom_fields_org_entity ON custom_field_definitions (organization_id, entity_type);
