@AGENTS.md

## Claude Code workflow

Opening this repository in Claude Code runs `.claude/hooks/session-start.sh`,
which installs locked dependencies when needed and runs `npm run build:cached`.

- `.mcp.json` registers the `rea` MCP server from this checkout
  (`node scripts/rea.mjs mcp`). After changing `src/`, run
  `npm run build:cached` and reconnect it with `/mcp`.
- `.claude/skills/reverse-engineer-anything` links to
  `.agents/skills/reverse-engineer-anything/`, so skill edits apply on the next
  session without regenerating `skills/`.
- Try a change from the terminal with `node scripts/rea.mjs <command>`, for
  example `node scripts/rea.mjs doctor` or
  `node scripts/rea.mjs analyze-javascript-application /abs/path --json`.
- Before pushing, run `npm run check:fast` and the focused tests for the
  change (`npm run test:focused -- PATH...`).
