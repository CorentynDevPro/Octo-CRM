# Performance Tests

Load tests using k6.

## Setup

```bash
k6 run tests/performance/load-test.js
```

Scenarios:
- 100 concurrent users browsing leads list
- 50 concurrent deal create operations
- Pipeline summary view under load
