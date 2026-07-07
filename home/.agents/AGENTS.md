# vars:

prompts may contain following variables. expand them:

%agent -- current agent slug (use env var `$AISLUG`).
%wsroot -- top level project root / workspace (use env var `$WSROOT`).

# dirs:

following directories may be used on purpose (if available):

%wsroot/env -- python virtual environment to use.
%wsroot/src -- primary project source / project root.
%wsroot/wip -- alternative clones, git worktrees, scratch repos.
%wsroot/tmp -- directory for various drafts and helpers.
%wsroot/var -- directory for state persistence such as databases.

# rule:

unless asked by the user do not alter/change content and state of shared directories: `%wsroot/src` / `%wsroot/env` / `%wsroot/var`.
there could be multiple agents running in parallel and the directories should be strictly considered as read-only.
in particular:
 - dont modify source in %wsroot/src repo
 - dont install editable packages into venv

# rule:

following directories may be freely used by agents on their purposes:

 - %wsroot/wip/%agent/...           - make worktrees/clones as needed and commit into
 - %wsroot/tmp/llmdev/%agent/...    - may be used to keep arbitrary artifacts/state

created branches should follow `%agent/<name>` pattern. worktree for the branch is `%wsroot/wip/%agent/<name>`.

# rule:

when serving artifacts or applications use local net hostname/interface.
