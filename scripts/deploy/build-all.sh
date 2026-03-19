#!/usr/bin/env bash
set -euo pipefail

echo "🏗️  Building all services..."
pnpm build

echo "🐳 Building Docker images..."
docker compose -f infrastructure/docker/docker-compose.services.yml build

echo "✅ Build complete"
