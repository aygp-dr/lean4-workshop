# Agent Instructions

This project uses **bd** (beads) for issue tracking. Run `bd onboard` to get started.

## Development Practices

### Experiment-Driven Development (EDD)

1. **Hypothesis First**: Before implementing, state what you expect to happen
2. **Small Experiments**: Test assumptions with minimal code
3. **Measure & Document**: Record outcomes in issue comments
4. **Iterate**: Refine based on experimental results

Example workflow:
```bash
bd new "Experiment: Test if List.reverse is O(n)" -t task -l experiment
# Write minimal test code
# Measure and document findings
bd close <id> -r "Confirmed O(n) via benchmarks"
```

### Progressive Commit Protocol

Commit frequently in logical increments:

| Stage | Commit Message Prefix | Example |
|-------|----------------------|---------|
| Setup | `chore:` | `chore: add lakefile.toml` |
| WIP | `wip:` | `wip: draft List.sort theorem` |
| Feature | `feat:` | `feat: prove sort_idempotent` |
| Fix | `fix:` | `fix: correct termination proof` |
| Refactor | `refactor:` | `refactor: extract common tactics` |
| Docs | `docs:` | `docs: add tactic cheatsheet` |

**Progressive stages:**
1. Skeleton (compiles, uses `sorry`)
2. Draft (partial proofs)
3. Complete (all proofs done)
4. Polished (clean, documented)

### PERT Estimation

Use PERT (Program Evaluation and Review Technique) for task estimates:

```
Expected = (Optimistic + 4×Likely + Pessimistic) / 6
```

When creating issues, use the `-e` flag with minutes:
```bash
# For a task estimated at: O=30m, L=60m, P=120m
# PERT = (30 + 240 + 120) / 6 = 65 minutes
bd new "Prove commutativity of addition" -t task -e 65
```

## Quick Reference

```bash
bd ready              # Find available work
bd show <id>          # View issue details
bd update <id> -s in_progress  # Claim work
bd close <id>         # Complete work
bd sync               # Sync with git
```

## File Format Convention

- **Use org-mode** (`.org`) for all documentation
- **Exceptions**: AGENTS.md, CLAUDE.md (for tooling compatibility)
- **Lean files**: `.lean` for proofs and code

## Landing the Plane (Session Completion)

**When ending a work session**, you MUST complete ALL steps below. Work is NOT complete until `git push` succeeds.

**MANDATORY WORKFLOW:**

1. **File issues for remaining work** - Create issues for anything that needs follow-up
2. **Run quality gates** (if code changed) - `gmake check`, verify proofs compile
3. **Update issue status** - Close finished work, update in-progress items
4. **PUSH TO REMOTE** - This is MANDATORY:
   ```bash
   git pull --rebase
   bd sync
   git push
   git status  # MUST show "up to date with origin"
   ```
5. **Clean up** - Clear stashes, prune remote branches
6. **Verify** - All changes committed AND pushed
7. **Hand off** - Provide context for next session

**CRITICAL RULES:**
- Work is NOT complete until `git push` succeeds
- NEVER stop before pushing - that leaves work stranded locally
- NEVER say "ready to push when you are" - YOU must push
- If push fails, resolve and retry until it succeeds
