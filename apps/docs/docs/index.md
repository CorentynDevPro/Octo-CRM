# Octo CRM Documentation

Welcome to the Octo CRM developer documentation.

## Architecture

Octo CRM is a TurboRepo monorepo structured into 5 layers:

1. **Apps** — Frontend (Nuxt 3), Admin panel, API Gateway, Docs
2. **Packages** — Shared libraries (types, utils, sdk, ui, validation)
3. **Services** — Backend microservices (auth, user, CRM, billing, etc.)
4. **Modules** — Business domain logic
5. **Database** — PostgreSQL schemas, migrations, seeds

## Quick Start

```bash
pnpm install
cp .env.example .env
pnpm docker:up
pnpm dev
```

## Services

| Service | Port | Responsibility |
|---|---|---|
| api-gateway | 4000 | BFF, routing, rate limiting |
| auth-service | 4001 | Authentication & JWT |
| user-service | 4002 | User management |
| crm-service | 4003 | Leads, contacts, deals |
| billing-service | 4004 | Invoices, payments |
| notification-service | 4005 | Email, SMS, push |
| analytics-service | 4006 | Events, metrics |
| file-service | 4007 | File uploads |
| audit-service | 4008 | Audit logs |
