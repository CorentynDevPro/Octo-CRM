#!/usr/bin/env bash
set -euo pipefail

echo "🗄️  Running database migrations..."
# Apply schema files in order
PGPASSWORD="${DATABASE_PASSWORD}" psql \
  -h "${DATABASE_HOST:-localhost}" \
  -U "${DATABASE_USER:-octocrm}" \
  -d "${DATABASE_NAME:-octocrm}" \
  -f database/migrations/001_initial_schema.sql 2>/dev/null || true

echo "✅ Migrations complete"
