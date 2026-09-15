#!/bin/bash

#exec >"$HOME/llmdev/tmp/hook.log" 2>&1
#set -ex

content="$(cat)"

HARNESS="${1:-"$(basename "$(cat /proc/$PPID/cmdline | head -1z)")"}"

{
	ps -AFHww;
	echo;
	env;
	echo;
	pwd;
	echo;
	cat /proc/$PPID/comm;
	cat /proc/$PPID/cmdline | xargs -0n1;
	basename "$(readlink -f /proc/$PPID/exe)";
	echo;
	echo "${content}";
	echo;
	echo "$HARNESS";
} > "$HOME/llmdev/tmp/vars.log"

PROMPT="\
%agent=$HARNESS
%cookie=$(uuidgen -r)
"

case "$HARNESS" in
	agy)
		jq -n \
			--arg prompt "$PROMPT" \
			'.injectSteps[0].ephemeralMessage = $prompt'
		;;
	claude|codex)
		SYSTEM="CONTEXT:DONE"
		EVENT="$(echo "$content" | jq -r '.hook_event_name')"
		jq -n \
			--arg system "$SYSTEM" \
			--arg event "$EVENT" \
			--arg prompt "$PROMPT" \
			'{systemMessage: $system, hookSpecificOutput: {hookEventName: $event, additionalContext: $prompt}}'
		;;
	copilot)
		jq -n \
			--arg prompt "$PROMPT" \
			'{additionalContext: $prompt}'
		;;
	cursor)
		jq -n \
			--arg prompt "$PROMPT" \
			'{additional_context: $prompt}'
		;;
	*)
		echo "$PROMPT"
		;;
esac
