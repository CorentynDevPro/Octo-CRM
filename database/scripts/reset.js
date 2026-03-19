#!/usr/bin/env node
// database/scripts/reset.js
// Drops all tables, re-runs migrations, then seeds.
// Usage: node scripts/reset.js

'use strict';

const { execSync } = require('child_process');
const path         = require('path');

const scriptsDir = __dirname;

function run(script) {
  console.log(`[reset] Running ${script}...`);
  execSync(`node ${path.join(scriptsDir, script)}`, { stdio: 'inherit' });
}

// TODO: add DROP/TRUNCATE logic before migrate when DB connection is wired up
run('migrate.js');
run('seed.js');

console.log('[reset] Complete.');
