#!/usr/bin/env node
// database/scripts/seed.js
// Applies seed SQL files in order.
// Usage: node scripts/seed.js

'use strict';

const fs   = require('fs');
const path = require('path');

const SEEDS_DIR = path.join(__dirname, '..', 'seeds');

async function run() {
  const files = fs.readdirSync(SEEDS_DIR)
    .filter(f => f.endsWith('.sql'))
    .sort();

  if (files.length === 0) {
    console.log('No seed files found in', SEEDS_DIR);
    return;
  }

  for (const file of files) {
    console.log(`[seed] Applying: ${file}`);
    // TODO: connect to PostgreSQL and execute each file's SQL
  }

  console.log('[seed] Done.');
}

run().catch(err => { console.error(err); process.exit(1); });
