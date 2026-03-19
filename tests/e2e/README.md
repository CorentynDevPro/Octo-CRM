# End-to-End Tests

E2E tests use Playwright to test the full stack.

## Setup

```bash
pnpm docker:up
pnpm dev
npx playwright test
```

Test scenarios:
- User login / logout
- Create lead → convert to contact
- Create deal and move through pipeline stages
- Generate and download invoice
