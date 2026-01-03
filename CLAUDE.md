# Claude Code Instructions for lean4-workshop

## Project Overview

This is a Lean 4 workshop repository for learning theorem proving and functional programming.

## File Format Rules

- **Use org-mode** (`.org`) for all documentation and notes
- **Exceptions**: AGENTS.md, CLAUDE.md (tooling compatibility)
- **Lean files**: `.lean` for proofs and code
- **No markdown** except the two exceptions above

## Development Practices

### Experiment-Driven Development

1. State hypothesis before implementing
2. Create small experiments to test assumptions
3. Document outcomes in beads issues
4. Iterate based on findings

### Progressive Commit Protocol

Commit in logical stages using conventional commits:
- `chore:` - setup, config
- `wip:` - work in progress (uses `sorry`)
- `feat:` - complete feature/proof
- `fix:` - corrections
- `refactor:` - cleanup
- `docs:` - documentation

### PERT Estimation

When creating beads issues, use PERT formula:
```
Expected = (Optimistic + 4×Likely + Pessimistic) / 6
```

Use `-e <minutes>` flag with `bd new`.

## Lean 4 Specific

### Verify Before Commit

```bash
gmake check           # Quick verification
lean <file>.lean      # Check specific file
lake build            # Full build
```

### Common Proof Patterns

- `rfl` - reflexivity
- `simp` - simplification
- `exact` - provide exact term
- `constructor` - split conjunction
- `sorry` - placeholder (WIP only)

## Beads Issue Tracking

```bash
bd ready              # Find work
bd new "title" -t task -e 30 -l label  # Create issue
bd update <id> -s in_progress          # Start work
bd close <id> -r "reason"              # Complete
bd sync                                # Sync with git
```

## Quality Gates

Before pushing:
1. All `.lean` files compile without errors
2. No `sorry` in completed proofs
3. `gmake check` passes
4. Beads issues updated
