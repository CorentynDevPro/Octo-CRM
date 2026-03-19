-- ============================================================
-- EMPLOYEES
-- ============================================================
CREATE TABLE departments (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID         NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    name            VARCHAR(255) NOT NULL,
    parent_id       UUID         REFERENCES departments(id),
    manager_id      UUID         REFERENCES users(id) ON DELETE SET NULL,
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    deleted_at      TIMESTAMPTZ
);

CREATE TABLE employees (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         UUID         NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    organization_id UUID         NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    department_id   UUID         REFERENCES departments(id) ON DELETE SET NULL,
    employee_number VARCHAR(50),
    job_title       VARCHAR(255),
    hire_date       DATE         NOT NULL,
    end_date        DATE,
    employment_type VARCHAR(50)  NOT NULL DEFAULT 'FULL_TIME',
    manager_id      UUID         REFERENCES employees(id) ON DELETE SET NULL,
    salary          NUMERIC(12, 2),
    salary_currency CHAR(3)      DEFAULT 'USD',
    address         JSONB        NOT NULL DEFAULT '{}',
    emergency_contact JSONB      NOT NULL DEFAULT '{}',
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    deleted_at      TIMESTAMPTZ
);

CREATE INDEX idx_employees_org    ON employees (organization_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_employees_dept   ON employees (department_id)   WHERE deleted_at IS NULL;
CREATE INDEX idx_employees_manager ON employees (manager_id)     WHERE deleted_at IS NULL;
CREATE INDEX idx_departments_org  ON departments (organization_id) WHERE deleted_at IS NULL;
