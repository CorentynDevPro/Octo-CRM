-- ============================================================
-- PERFORMANCE INDEXES — additional composite / partial indexes
-- beyond those defined in individual schema files
-- ============================================================

-- Full-text search: leads
CREATE INDEX IF NOT EXISTS idx_leads_fts ON leads
  USING GIN (
    to_tsvector('english', coalesce(first_name,'') || ' ' || coalesce(last_name,'') || ' ' || coalesce(email,'') || ' ' || coalesce(company,''))
  ) WHERE deleted_at IS NULL;

-- Full-text search: contacts
CREATE INDEX IF NOT EXISTS idx_contacts_fts ON contacts
  USING GIN (
    to_tsvector('english', coalesce(first_name,'') || ' ' || coalesce(last_name,'') || ' ' || coalesce(email,'') || ' ' || coalesce(company,''))
  ) WHERE deleted_at IS NULL;

-- Full-text search: deals
CREATE INDEX IF NOT EXISTS idx_deals_fts ON deals
  USING GIN (to_tsvector('english', coalesce(title,'')))
  WHERE deleted_at IS NULL;

-- JSONB GIN indexes for custom_fields querying
CREATE INDEX IF NOT EXISTS idx_leads_custom_fields    ON leads    USING GIN (custom_fields);
CREATE INDEX IF NOT EXISTS idx_contacts_custom_fields ON contacts USING GIN (custom_fields);
CREATE INDEX IF NOT EXISTS idx_deals_custom_fields    ON deals    USING GIN (custom_fields);

-- Covering index for dashboard: open deals with value
CREATE INDEX IF NOT EXISTS idx_deals_dashboard ON deals (organization_id, pipeline_id, stage_id, value)
  WHERE status = 'OPEN' AND deleted_at IS NULL;
