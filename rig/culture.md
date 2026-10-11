# Rig culture

Every seat reads this first.

- The work is shaped project → mission → slice. `slices/MISSION.md` holds the project and the
  mission. Each slice file holds one spec (what must work) and, when done, its proof.
- Build only what your slice spec asks for. If a step isn't in the spec, write it under
  "Found" in the slice file and stop. Don't widen the slice yourself.
- A slice is done when its proof section shows the check passing (a command and its output,
  or a screenshot path). Stop once the proof is written. Don't polish the proof.
- You can't sign off your own slice. The lead checks the proof against the spec.
- Commit small, one change each: `type(scope): what changed`. No AI credit lines.
- Secrets live in `.env.local`, never in a commit.

## Refocus
Before each new step, and after any context compaction, reread in this order:
your slice file → `slices/MISSION.md` → this file. Ask: does my next step serve the slice?
