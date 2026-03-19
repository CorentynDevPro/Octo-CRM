-- ============================================================
-- PRODUCTS & SERVICES
-- ============================================================
CREATE TABLE products (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID           NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    sku             VARCHAR(100),
    name            VARCHAR(255)   NOT NULL,
    description     TEXT,
    unit_price      NUMERIC(15, 2) NOT NULL DEFAULT 0,
    currency        CHAR(3)        NOT NULL DEFAULT 'USD',
    unit            VARCHAR(50)    NOT NULL DEFAULT 'unit',
    tax_rate        NUMERIC(5, 2)  NOT NULL DEFAULT 0,
    is_active       BOOLEAN        NOT NULL DEFAULT TRUE,
    product_type    VARCHAR(50)    NOT NULL DEFAULT 'product', -- product, service
    created_at      TIMESTAMPTZ    NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ    NOT NULL DEFAULT NOW(),
    deleted_at      TIMESTAMPTZ,
    CONSTRAINT uq_products_sku_org UNIQUE (organization_id, sku)
);

CREATE INDEX idx_products_org  ON products (organization_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_products_type ON products (product_type)    WHERE deleted_at IS NULL;
