#!/usr/bin/env bash
# Start the rig: one worktree + agent pane per seat, beside the lead pane you run this from.
# Run inside Herdr, from the main checkout:  rig/up.sh            (or rig/up.sh --dry-run)
set -euo pipefail

SEATS=(ui backend)
KIND="${RIG_AGENT_KIND:-claude}"   # any kind `herdr agent start --help` lists
DRY=0; [[ "${1:-}" == "--dry-run" ]] && DRY=1

MAIN="$(git rev-parse --show-toplevel)"
NAME="$(basename "$MAIN")"
run() { if (( DRY )); then echo "+ $*"; else "$@"; fi; }

if (( ! DRY )) && [[ "${HERDR_ENV:-}" != 1 ]]; then
  echo "Run this inside a Herdr pane (start Herdr with: herdr)." >&2; exit 1
fi

dir=right
for seat in "${SEATS[@]}"; do
  wt="$(dirname "$MAIN")/$NAME-$seat"
  if [[ ! -d "$wt" ]]; then
    run git -C "$MAIN" worktree add -b "seat/$seat" "$wt" main
    [[ -f "$MAIN/.env.local" ]] && run cp "$MAIN/.env.local" "$wt/.env.local"
  fi
  if (( DRY )); then
    echo "+ herdr pane split --current --direction $dir --cwd $wt --no-focus"
    echo "+ herdr agent start $seat --kind $KIND --pane <new pane>"
  else
    pane="$(herdr pane split --current --direction "$dir" --cwd "$wt" --no-focus | jq -r '.result.pane.pane_id')"
    if ! herdr agent start "$seat" --kind "$KIND" --pane "$pane" >/dev/null 2>&1; then
      # A new worktree folder asks for trust first. Answer it in that pane; this waits.
      echo "Answer the prompt in the $seat pane (usually: trust this folder)."
      herdr agent wait "$seat" --until idle --until done --timeout 300000 >/dev/null
    fi
  fi
  run herdr agent prompt "$seat" "You are the $seat seat. Read $MAIN/rig/culture.md and $MAIN/rig/seats/$seat.md. Your worktree is $wt. Reply 'ready' and wait for a slice."
  dir=down
done

echo "Rig up: ${SEATS[*]}. Start the lead here with the prompt: read rig/culture.md and rig/seats/lead.md."
