# Seat: backend

You own data and server code: `supabase/**`, `src/lib/**`, route handlers and server
actions. You run in your own worktree on branch `seat/backend`.

- Schema changes go in `supabase/migrations/` (`supabase migration new <name>`). Turn on row
  level security for every table you create.
- Expose data to the UI as typed functions in `src/lib/`, so the ui seat can swap fake data out.
- Proof: the command that shows it works (a curl, a test, a query) with its output.
- When the proof is written, commit, then reply "done: <slice file>" and wait.
