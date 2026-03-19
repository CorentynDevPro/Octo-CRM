# Database Migrations

Migrations are numbered sequentially and applied in order.

## Naming Convention

```
{timestamp}_{description}.sql
```

Example: `20250101000001_create_core_tables.sql`

## How to Run

```bash
pnpm db:migrate        # Apply pending migrations
pnpm db:seed           # Seed with sample data
pnpm db:reset          # Drop all + re-migrate + seed
```

## Order

1. Core (organizations, users, roles, sessions, teams, settings)
2. CRM (leads, contacts, pipelines, stages, deals, activities, notes, tags)
3. Billing (customers, products, invoices, payments, subscriptions)
4. Inventory (warehouses, inventory, movements)
5. HR (departments, employees, leave)
6. Analytics (events, metrics, reports)
7. Audit (audit_logs)
8. Integration (integrations, webhooks)
9. Shared (notifications, files)
10. Triggers, Views, Functions, Indexes
