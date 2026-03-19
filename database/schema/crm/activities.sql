-- ============================================================
-- ACTIVITIES — calls, emails, meetings, tasks
-- ============================================================
CREATE TABLE activities (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID        NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    owner_id        UUID        REFERENCES users(id) ON DELETE SET NULL,
    type            VARCHAR(50) NOT NULL, -- CALL, EMAIL, MEETING, TASK, NOTE
    subject         VARCHAR(512),
    body            TEXT,
    due_at          TIMESTAMPTZ,
    done_at         TIMESTAMPTZ,
    is_done         BOOLEAN     NOT NULL DEFAULT FALSE,
    -- Polymorphic relation
    related_type    VARCHAR(50), -- lead, contact, deal
    related_id      UUID,
    custom_fields   JSONB       NOT NULL DEFAULT '{}',
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_by_id   UUID        REFERENCES users(id),
    deleted_at      TIMESTAMPTZ
);

CREATE INDEX idx_activities_org          ON activities (organization_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_activities_owner        ON activities (owner_id)        WHERE deleted_at IS NULL;
CREATE INDEX idx_activities_related      ON activities (related_type, related_id);
CREATE INDEX idx_activities_due          ON activities (due_at)  WHERE is_done = FALSE AND deleted_at IS NULL;
CREATE INDEX idx_activities_type         ON activities (type)    WHERE deleted_at IS NULL;
