#!/usr/bin/env bash
set -euo pipefail

echo "🌱 Seeding database..."
PGPASSWORD="${DATABASE_PASSWORD}" psql \
  -h "${DATABASE_HOST:-localhost}" \
  -U "${DATABASE_USER:-octocrm}" \
  -d "${DATABASE_NAME:-octocrm}" \
  -f database/seeds/01_organizations.sql \
  -f database/seeds/02_users.sql

echo "✅ Seed complete"
