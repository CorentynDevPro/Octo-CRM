#!/usr/bin/env bash
set -euo pipefail

echo "🐙 Setting up Octo CRM development environment..."

# Check prerequisites
command -v node  >/dev/null 2>&1 || { echo "❌ Node.js is required"; exit 1; }
command -v pnpm  >/dev/null 2>&1 || { echo "❌ pnpm is required: npm i -g pnpm"; exit 1; }
command -v docker >/dev/null 2>&1 || { echo "❌ Docker is required"; exit 1; }

# Copy env file
if [ ! -f .env ]; then
  cp .env.example .env
  echo "✅ Created .env from .env.example"
fi

# Install dependencies
echo "📦 Installing dependencies..."
pnpm install

# Start infrastructure
echo "🐳 Starting Docker services..."
docker compose -f infrastructure/docker/docker-compose.yml up -d

echo "✅ Development environment ready!"
echo "   Run: pnpm dev"
