# 🐙 Octo CRM

> **Enterprise-grade, open-source CRM** — built as a TurboRepo monorepo with NuxtJS, TailwindCSS, Node.js microservices, and PostgreSQL.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Node.js](https://img.shields.io/badge/Node.js-≥20-brightgreen)](https://nodejs.org)
[![pnpm](https://img.shields.io/badge/pnpm-≥9-orange)](https://pnpm.io)
[![TurboRepo](https://img.shields.io/badge/TurboRepo-2.x-red)](https://turbo.build)

---

## ✨ Features

- **Multi-tenant** — full organization isolation on every table
- **CRM core** — Leads, Contacts, Deals, Pipelines, Activities, Notes, Tags
- **Billing** — Customers, Products, Invoices, Payments, Subscriptions
- **HR** — Departments, Employees, Leave management
- **Inventory** — Warehouses, Stock, Movements
- **Analytics** — Partitioned event log, pre-aggregated metrics, saved reports
- **RBAC + ABAC** — Roles, Permissions, Policy engine
- **Audit trail** — Immutable change log for every entity
- **External integrations** — Webhooks, pluggable providers
- **200+ DB tables** — Split across 9 domain schemas
- **8 microservices** — Auth, User, CRM, Billing, Notification, Analytics, File, Audit
- **CI/CD** — GitHub Actions: lint, test, build, deploy

---

## 🗂️ Project Structure

```
octo-crm/
├── apps/
│   ├── web/                  # Main frontend — Nuxt 3 + Tailwind
│   ├── admin/                # Admin panel — Nuxt 3
│   ├── api-gateway/          # BFF / API Gateway — Fastify
│   └── docs/                 # Developer docs — VitePress
│
├── packages/
│   ├── ui/                   # Design system (Tailwind + tokens)
│   ├── config/               # Shared ESLint, TSConfig, Prettier
│   ├── utils/                # String, date, currency, pagination helpers
│   ├── types/                # TypeScript entities, DTOs, enums
│   ├── validation/           # Zod schemas
│   ├── hooks/                # Vue 3 composables
│   ├── sdk/                  # Typed API client
│   └── constants/            # HTTP codes, permissions, cache TTLs
│
├── services/
│   ├── auth-service/         # JWT auth & sessions     — port 4001
│   ├── user-service/         # User management         — port 4002
│   ├── crm-service/          # Leads, contacts, deals  — port 4003
│   ├── billing-service/      # Invoices & payments     — port 4004
│   ├── notification-service/ # Email/SMS/push (BullMQ) — port 4005
│   ├── analytics-service/    # Events & metrics        — port 4006
│   ├── file-service/         # Uploads (S3-compatible) — port 4007
│   └── audit-service/        # Immutable audit log     — port 4008
│
├── modules/                  # Business-domain logic
│   ├── crm/
│   │   ├── leads/            # entity, service, repository, validator
│   │   ├── deals/
│   │   ├── contacts/
│   │   └── pipelines/
│   ├── users/
│   ├── organizations/
│   ├── billing/
│   ├── inventory/
│   ├── hr/
│   ├── permissions/          # Guards, RBAC policies
│   └── reporting/
│
├── database/
│   ├── schema/
│   │   ├── core/             # organizations, users, roles, sessions, teams
│   │   ├── crm/              # leads, contacts, deals, pipelines, activities
│   │   ├── billing/          # customers, products, invoices, payments
│   │   ├── inventory/        # warehouses, stock, movements
│   │   ├── hr/               # employees, departments, leave
│   │   ├── analytics/        # events (partitioned), metrics, reports
│   │   ├── audit/            # audit_logs (partitioned)
│   │   ├── integration/      # integrations, webhooks
│   │   └── shared/           # notifications, files
│   ├── migrations/
│   ├── seeds/
│   ├── views/                # Pipeline summary, user permissions
│   ├── functions/            # Deal value totals
│   ├── triggers/             # updated_at, audit log
│   └── indexes/              # GIN full-text, JSONB, covering indexes
│
├── infrastructure/
│   ├── docker/               # docker-compose (dev + services)
│   ├── nginx/                # Reverse proxy config
│   ├── kubernetes/           # (K8s manifests — coming soon)
│   ├── terraform/            # (IaC — coming soon)
│   └── monitoring/           # Prometheus scrape config
│
├── scripts/
│   ├── dev/setup.sh
│   ├── db/migrate.sh + seed.sh
│   └── deploy/build-all.sh
│
├── tests/
│   ├── unit/                 # Utils, validation, permissions
│   ├── integration/
│   ├── e2e/
│   └── performance/
│
└── .github/workflows/        # lint.yml, test.yml, build.yml, deploy.yml
```

---

## 🚀 Quick Start

### Prerequisites

| Tool | Version |
|------|---------|
| Node.js | ≥ 20 |
| pnpm | ≥ 9 |
| Docker | ≥ 24 |
| PostgreSQL | 16 (via Docker) |

### 1. Clone & Install

```bash
git clone https://github.com/CorentynDevPro/Octo-CRM.git
cd Octo-CRM
pnpm install
```

### 2. Configure Environment

```bash
cp .env.example .env
# Edit .env with your values
```

### 3. Start Infrastructure (Docker)

```bash
pnpm docker:up
# Starts: PostgreSQL 16, Redis 7, Meilisearch
```

### 4. Run Migrations & Seeds

```bash
pnpm db:migrate
pnpm db:seed
```

### 5. Start Development

```bash
pnpm dev
# All apps and services start in parallel via TurboRepo
```

| App | URL |
|-----|-----|
| Web (main frontend) | http://localhost:3000 |
| Admin panel | http://localhost:3001 |
| API Gateway | http://localhost:4000 |
| Docs | http://localhost:5173 |

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | [Nuxt 3](https://nuxt.com) + [TailwindCSS](https://tailwindcss.com) + [Pinia](https://pinia.vuejs.org) |
| Backend | [Fastify](https://fastify.dev) (microservices) |
| Database | [PostgreSQL 16](https://www.postgresql.org) |
| ORM | [Drizzle ORM](https://orm.drizzle.team) / [Prisma](https://prisma.io) (pluggable) |
| Validation | [Zod](https://zod.dev) |
| Cache | [Redis 7](https://redis.io) |
| Queue | [BullMQ](https://bullmq.io) |
| Search | [Meilisearch](https://www.meilisearch.com) |
| Monorepo | [TurboRepo](https://turbo.build) + [pnpm workspaces](https://pnpm.io/workspaces) |
| CI/CD | [GitHub Actions](https://github.com/features/actions) |
| Containers | [Docker](https://www.docker.com) + [Docker Compose](https://docs.docker.com/compose/) |
| Monitoring | [Prometheus](https://prometheus.io) |

---

## 📦 Packages

| Package | Description |
|---------|-------------|
| `@octo-crm/types` | TypeScript entities, DTOs, enums |
| `@octo-crm/validation` | Zod schemas for all forms & API inputs |
| `@octo-crm/utils` | String, date, currency, pagination utilities |
| `@octo-crm/constants` | HTTP codes, permission strings, cache TTLs |
| `@octo-crm/sdk` | Typed API client (`OctoCrmClient`) |
| `@octo-crm/hooks` | Vue 3 composables (`usePagination`, `useToast`, etc.) |
| `@octo-crm/ui` | Design system (Tailwind config, tokens, component types) |
| `@octo-crm/config` | Shared ESLint, TypeScript, Prettier configs |

---

## 🗄️ Database Design

### Philosophy

- **1 file = 1 entity** in `database/schema/`
- **9 domain schemas** — never a single monolithic schema
- **Soft deletes** everywhere (`deleted_at`)
- **Multi-tenant** — `organization_id` on every business table
- **Audit triggers** — automatic change log
- **Partitioned tables** — `analytics_events`, `audit_logs` (by month)
- **GIN indexes** — full-text search on leads, contacts, deals
- **JSONB** — `custom_fields`, `settings`, `address` — schema-flexible

### Domains

| Domain | Tables | Key entities |
|--------|--------|--------------|
| `core` | 6 | organizations, users, roles, permissions, sessions, teams |
| `crm` | 10 | leads, contacts, deals, pipelines, stages, activities, notes, tags |
| `billing` | 5 | customers, products, invoices, invoice_lines, payments, subscriptions |
| `inventory` | 3 | warehouses, inventory, inventory_movements |
| `hr` | 4 | departments, employees, leave_types, leave_requests |
| `analytics` | 3 | analytics_events, metrics, reports |
| `audit` | 1 | audit_logs |
| `integration` | 3 | integrations, webhooks, webhook_deliveries |
| `shared` | 2 | notifications, files |

---

## 🔐 Permissions (RBAC + ABAC)

```
modules/permissions/
├── guards/auth.guard.ts       # hasPermission, hasRole, hasAnyPermission
├── policies/resource.policy.ts # PolicyEngine with conditional rules
└── roles/role.entity.ts
```

Default roles: `SUPER_ADMIN`, `ADMIN`, `MANAGER`, `SALES_REP`, `SUPPORT`, `VIEWER`

---

## 🔌 Services

Each service is independently deployable:

```
services/{name}/
├── src/
│   ├── index.ts              # Fastify app entry
│   ├── modules/              # Route controllers
│   ├── services/             # Business logic
│   ├── repositories/         # DB access layer
│   └── events/               # (optional) event emitters
├── tests/
├── Dockerfile                # Multi-stage build
└── package.json
```

---

## 🧪 Testing

```bash
pnpm test                     # Run all unit tests
pnpm test --filter=web        # Single package
```

| Layer | Tool | Location |
|-------|------|----------|
| Unit | Vitest | `tests/unit/`, `services/*/tests/` |
| Integration | Vitest | `tests/integration/` |
| E2E | Playwright | `tests/e2e/` |
| Performance | k6 | `tests/performance/` |

---

## ⚙️ Scripts

```bash
pnpm dev              # Start all in dev mode
pnpm build            # Build all packages + apps
pnpm lint             # Lint everything
pnpm test             # Run unit tests
pnpm type-check       # TypeScript type check
pnpm docker:up        # Start infrastructure
pnpm docker:down      # Stop infrastructure
pnpm db:migrate       # Run migrations
pnpm db:seed          # Seed sample data
pnpm db:reset         # Drop + migrate + seed
```

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/my-feature`
3. Commit your changes: `git commit -m 'feat: add my feature'`
4. Push: `git push origin feature/my-feature`
5. Open a Pull Request

Please follow [Conventional Commits](https://www.conventionalcommits.org/).

---

## 📄 License

[MIT](LICENSE) © Octo CRM Contributors
