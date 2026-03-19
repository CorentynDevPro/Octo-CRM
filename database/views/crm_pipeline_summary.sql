-- ============================================================
-- VIEW: CRM pipeline summary — deals per stage with totals
-- ============================================================
CREATE OR REPLACE VIEW v_pipeline_summary AS
SELECT
    p.id              AS pipeline_id,
    p.organization_id,
    p.name            AS pipeline_name,
    s.id              AS stage_id,
    s.name            AS stage_name,
    s.stage_order,
    s.probability,
    COUNT(d.id)                         AS deal_count,
    COALESCE(SUM(d.value), 0)           AS total_value,
    COALESCE(SUM(d.value * s.probability / 100), 0) AS weighted_value
FROM pipelines   p
JOIN stages      s ON s.pipeline_id = p.id
LEFT JOIN deals  d ON d.stage_id = s.id AND d.deleted_at IS NULL AND d.status = 'OPEN'
WHERE p.deleted_at IS NULL
GROUP BY p.id, p.organization_id, p.name, s.id, s.name, s.stage_order, s.probability
ORDER BY p.id, s.stage_order;
