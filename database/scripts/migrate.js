#!/usr/bin/env node
// database/scripts/migrate.js
// Applies pending SQL migration files in order.
// Usage: node scripts/migrate.js

'use strict';

const fs   = require('fs');
const path = require('path');

const MIGRATIONS_DIR = path.join(__dirname, '..', 'migrations');

async function run() {
  const files = fs.readdirSync(MIGRATIONS_DIR)
    .filter(f => f.endsWith('.sql'))
    .sort();

  if (files.length === 0) {
    console.log('No migration files found in', MIGRATIONS_DIR);
    return;
  }

  for (const file of files) {
    console.log(`[migrate] Applying: ${file}`);
    // TODO: connect to PostgreSQL and execute each file's SQL
  }

  console.log('[migrate] Done.');
}

run().catch(err => { console.error(err); process.exit(1); });
