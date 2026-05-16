#!/usr/bin/env bash
# Claude Code statusLine command
# Reads JSON from stdin and prints a single-line status string.

input=$(cat)

BLUE="\e[94m"
GREEN="\e[92m"
YELLOW="\e[93m"
RESET="\e[0m"

model=$(printf '%s' "$input" | jq -r '.model.id // "claude"')
effort=$(printf '%s' "$input" | jq -r '.effort.level // empty')
cwd=$(printf '%s' "$input" | jq -r '.workspace.current_dir // .cwd // ""')
dir=$(dirs +0)

# branch=$(git -C "$cwd" --no-optional-locks rev-parse --abbrev-ref HEAD 2>/dev/null || true)

parts="$BLUE$model $effort$RESET . $GREEN$dir$RESET"

if [ -n "$branch" ]; then
    parts="$parts . $branch"
fi

used_fh=$(printf '%s' "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
if [ -n "$used_fh" ]; then
    used_fh_fmt=$(printf '%.0f' "$used_fh")
    used_fh_fmt=$(( 100 - $used_fh_fmt ))
    parts="$parts .$YELLOW 5h ${used_fh_fmt}% left$RESET"
fi

used_sd=$(printf '%s' "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
if [ -n "$used_sd" ]; then
    used_sd_fmt=$(printf '%.0f' "$used_sd")
    used_sd_fmt=$(( 100 - $used_sd_fmt ))
    parts="$parts .$YELLOW weekly ${used_sd_fmt}% left$RESET"
fi

used_ctx=$(printf '%s' "$input" | jq -r '.context_window.used_percentage // empty')
if [ -n "$used_ctx" ]; then
    used_ctx_fmt=$(printf '%.0f' "$used_ctx")
    parts="$parts .$YELLOW Context ${used_ctx_fmt}% used$RESET"
fi

#printf '%s\n' "$parts"
echo -e "$parts"
