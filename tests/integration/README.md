# Integration Tests

Integration tests require a running PostgreSQL + Redis instance.

## Setup

```bash
pnpm docker:up
pnpm test:integration
```

Tests cover:
- Service-to-service communication via API Gateway
- Database persistence through repository layer
- JWT authentication flow (login → access protected route)
- Lead create → convert → contact flow
