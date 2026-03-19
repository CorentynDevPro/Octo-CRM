-- ============================================================
-- BILLING CUSTOMERS
-- ============================================================
CREATE TABLE billing_customers (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id     UUID           NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    contact_id          UUID           REFERENCES contacts(id) ON DELETE SET NULL,
    external_id         VARCHAR(255),
    name                VARCHAR(255)   NOT NULL,
    email               VARCHAR(320),
    phone               VARCHAR(30),
    address             JSONB          NOT NULL DEFAULT '{}',
    tax_id              VARCHAR(100),
    currency            CHAR(3)        NOT NULL DEFAULT 'USD',
    payment_terms       SMALLINT       NOT NULL DEFAULT 30,
    credit_limit        NUMERIC(15, 2) NOT NULL DEFAULT 0,
    notes               TEXT,
    created_at          TIMESTAMPTZ    NOT NULL DEFAULT NOW(),
    updated_at          TIMESTAMPTZ    NOT NULL DEFAULT NOW(),
    deleted_at          TIMESTAMPTZ
);

CREATE INDEX idx_billing_customers_org     ON billing_customers (organization_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_billing_customers_contact ON billing_customers (contact_id)      WHERE contact_id IS NOT NULL;
