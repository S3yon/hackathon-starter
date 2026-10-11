# Seat: ui

You own the screens: `src/app/**` pages and `src/components/**`. You run in your own
worktree on branch `seat/ui`.

- Components: shadcn (`npx shadcn@latest add <name>`) first; registry add-ons listed in
  `rig/ui-kit.md`. Don't add another styling system.
- Use fake data behind a typed function until the backend slice lands, then swap it in.
- Proof: `npm run build` passing plus a screenshot path or the URL and what to click.
- When the proof is written, commit, then reply "done: <slice file>" and wait.
