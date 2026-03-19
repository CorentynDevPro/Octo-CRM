-- ============================================================
-- INVOICES
-- ============================================================
CREATE TABLE invoices (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id     UUID           NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    customer_id         UUID           NOT NULL REFERENCES billing_customers(id),
    deal_id             UUID           REFERENCES deals(id) ON DELETE SET NULL,
    invoice_number      VARCHAR(50)    NOT NULL,
    status              VARCHAR(50)    NOT NULL DEFAULT 'DRAFT',
    issue_date          DATE           NOT NULL DEFAULT CURRENT_DATE,
    due_date            DATE           NOT NULL,
    paid_at             TIMESTAMPTZ,
    subtotal            NUMERIC(15, 2) NOT NULL DEFAULT 0,
    tax_amount          NUMERIC(15, 2) NOT NULL DEFAULT 0,
    discount_amount     NUMERIC(15, 2) NOT NULL DEFAULT 0,
    total               NUMERIC(15, 2) NOT NULL DEFAULT 0,
    currency            CHAR(3)        NOT NULL DEFAULT 'USD',
    notes               TEXT,
    terms               TEXT,
    created_at          TIMESTAMPTZ    NOT NULL DEFAULT NOW(),
    updated_at          TIMESTAMPTZ    NOT NULL DEFAULT NOW(),
    created_by_id       UUID           REFERENCES users(id),
    deleted_at          TIMESTAMPTZ,
    CONSTRAINT uq_invoice_number_org UNIQUE (organization_id, invoice_number)
);

CREATE TABLE invoice_lines (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    invoice_id  UUID           NOT NULL REFERENCES invoices(id) ON DELETE CASCADE,
    product_id  UUID           REFERENCES products(id) ON DELETE SET NULL,
    description VARCHAR(512)   NOT NULL,
    quantity    NUMERIC(10, 3) NOT NULL DEFAULT 1,
    unit_price  NUMERIC(15, 2) NOT NULL,
    tax_rate    NUMERIC(5, 2)  NOT NULL DEFAULT 0,
    discount    NUMERIC(5, 2)  NOT NULL DEFAULT 0,
    total       NUMERIC(15, 2) NOT NULL,
    line_order  SMALLINT       NOT NULL DEFAULT 0
);

CREATE INDEX idx_invoices_org      ON invoices (organization_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_invoices_customer ON invoices (customer_id);
CREATE INDEX idx_invoices_status   ON invoices (status)          WHERE deleted_at IS NULL;
CREATE INDEX idx_invoices_due      ON invoices (due_date)        WHERE status NOT IN ('PAID', 'CANCELLED');
CREATE INDEX idx_invoice_lines     ON invoice_lines (invoice_id);
