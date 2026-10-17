#!/bin/bash
# Prepares a Claude Code session for REA development: installs locked
# dependencies and builds the runtime so the project MCP server (.mcp.json)
# can start from this checkout.
set -euo pipefail

cd "${CLAUDE_PROJECT_DIR:-$(dirname "$0")/../..}"

# Reinstall only when the lockfile changed since the last install.
if ! node scripts/check-dependency-install.mjs >/dev/null 2>&1; then
  npm ci --no-audit --no-fund
fi

npm run build:cached
