#!/bin/bash

content="$(cat)"

HARNESS="${1:-"$(cat /proc/$PPID/comm)"}"

{
	env;
	echo "${content}";
	cat /proc/$PPID/comm
	echo;
} > "$HOME/llmdev/tmp/vars.log"

PROMPT="you are juvelir"

case "$HARNESS" in
	pi)
		echo "$PROMPT"
		;;
	agy)
		jq -n \
			--arg prompt "$PROMPT" \
			'.injectSteps[0].ephemeralMessage = $prompt'
		;;
	*)
		SYSTEM="CONTEXT:DONE"
		EVENT="$(echo "$content" | jq -r '.hook_event_name')"
		jq -n \
			--arg system "$SYSTEM" \
			--arg event "$EVENT" \
			--arg prompt "$PROMPT" \
			'{systemMessage: $system, hookSpecificOutput: {hookEventName: $event, additionalContext: $prompt}}'
		;;
esac
