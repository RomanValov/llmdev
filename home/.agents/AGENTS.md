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

unless asked by user do not change content of `%wsroot/src` directory.
there could be multiple agents running in parallel and `%wsroot/src` is considered as read-only reference then.
worktrees could be created at `%wsroot/wip`, i.e. `%wsroot/wip/%agent` or `%wsroot/wip/<name>.%agent`.

# rule:

for non-primary project sources (for trees at `%wsroot/wip`):
do not use editable installs. rely on PATH/PYTHONPATH to run executables/tests
to avoid conflicts in shared python virtual environment. it is okay to install 3rd-party dependencies though.
