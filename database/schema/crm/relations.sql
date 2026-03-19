-- ============================================================
-- CRM ENTITY RELATIONS — many-to-many between CRM entities
-- ============================================================
CREATE TABLE contact_deals (
    contact_id UUID NOT NULL REFERENCES contacts(id) ON DELETE CASCADE,
    deal_id    UUID NOT NULL REFERENCES deals(id)    ON DELETE CASCADE,
    PRIMARY KEY (contact_id, deal_id)
);

CREATE TABLE contact_organizations (
    contact_id      UUID NOT NULL REFERENCES contacts(id) ON DELETE CASCADE,
    organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    role            VARCHAR(100),
    is_primary      BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (contact_id, organization_id)
);

CREATE INDEX idx_contact_deals_deal     ON contact_deals (deal_id);
CREATE INDEX idx_contact_orgs_org       ON contact_organizations (organization_id);
