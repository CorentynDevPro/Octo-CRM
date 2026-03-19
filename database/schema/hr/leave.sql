-- ============================================================
-- LEAVE MANAGEMENT
-- ============================================================
CREATE TABLE leave_types (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID         NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    name            VARCHAR(100) NOT NULL,
    days_allowed    SMALLINT     NOT NULL DEFAULT 0,
    is_paid         BOOLEAN      NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE TABLE leave_requests (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID        NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    employee_id     UUID        NOT NULL REFERENCES employees(id) ON DELETE CASCADE,
    leave_type_id   UUID        NOT NULL REFERENCES leave_types(id),
    start_date      DATE        NOT NULL,
    end_date        DATE        NOT NULL,
    total_days      SMALLINT    NOT NULL,
    status          VARCHAR(50) NOT NULL DEFAULT 'PENDING',
    reason          TEXT,
    approved_by_id  UUID        REFERENCES users(id),
    approved_at     TIMESTAMPTZ,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_leave_requests_employee ON leave_requests (employee_id);
CREATE INDEX idx_leave_requests_status   ON leave_requests (status);
