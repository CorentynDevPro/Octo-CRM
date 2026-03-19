-- ============================================================
-- INVENTORY — stock levels per product per warehouse
-- ============================================================
CREATE TABLE inventory (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID           NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    product_id      UUID           NOT NULL REFERENCES products(id) ON DELETE CASCADE,
    warehouse_id    UUID           NOT NULL REFERENCES warehouses(id) ON DELETE CASCADE,
    quantity        NUMERIC(12, 3) NOT NULL DEFAULT 0,
    reserved        NUMERIC(12, 3) NOT NULL DEFAULT 0,
    reorder_point   NUMERIC(12, 3) NOT NULL DEFAULT 0,
    updated_at      TIMESTAMPTZ    NOT NULL DEFAULT NOW(),
    CONSTRAINT uq_inventory UNIQUE (product_id, warehouse_id)
);

CREATE TABLE inventory_movements (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID           NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    product_id      UUID           NOT NULL REFERENCES products(id),
    warehouse_id    UUID           NOT NULL REFERENCES warehouses(id),
    movement_type   VARCHAR(50)    NOT NULL, -- IN, OUT, ADJUSTMENT, TRANSFER
    quantity        NUMERIC(12, 3) NOT NULL,
    reference_type  VARCHAR(50),
    reference_id    UUID,
    notes           TEXT,
    created_at      TIMESTAMPTZ    NOT NULL DEFAULT NOW(),
    created_by_id   UUID           REFERENCES users(id)
);

CREATE INDEX idx_inventory_org       ON inventory (organization_id);
CREATE INDEX idx_inventory_product   ON inventory (product_id);
CREATE INDEX idx_inventory_movements ON inventory_movements (product_id, warehouse_id, created_at DESC);
