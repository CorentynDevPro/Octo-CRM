-- ============================================================
-- PAYMENTS
-- ============================================================
CREATE TABLE payments (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id     UUID           NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    invoice_id          UUID           NOT NULL REFERENCES invoices(id),
    customer_id         UUID           NOT NULL REFERENCES billing_customers(id),
    amount              NUMERIC(15, 2) NOT NULL,
    currency            CHAR(3)        NOT NULL DEFAULT 'USD',
    method              VARCHAR(50)    NOT NULL DEFAULT 'bank_transfer',
    status              VARCHAR(50)    NOT NULL DEFAULT 'PENDING',
    reference           VARCHAR(255),
    external_id         VARCHAR(255),
    paid_at             TIMESTAMPTZ,
    notes               TEXT,
    created_at          TIMESTAMPTZ    NOT NULL DEFAULT NOW(),
    updated_at          TIMESTAMPTZ    NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_payments_org      ON payments (organization_id);
CREATE INDEX idx_payments_invoice  ON payments (invoice_id);
CREATE INDEX idx_payments_customer ON payments (customer_id);
CREATE INDEX idx_payments_status   ON payments (status);
