# vars:

prompts may contain following variables. expand them:

%agent -- currentharness name (use env var `$AGENT`. guess if not set).
%wsdir -- top level project dir / workspace (use env var `$WSDIR`).
%wstag -- name of the project dir / workspace (use env var `$WSTAG`).

# dirs:

following directories may be used on purpose (if available):

%wsdir/env -- python virtual environment to use.
%wsdir/src -- primary project source / project dir.
%wsdir/wip -- alternative clones, git worktrees, scratch repos.
%wsdir/tmp -- directory for various drafts and helpers.
%wsdir/var -- directory for state persistence such as databases.

# rule:

unless asked by the user do not alter/change content and state of shared directories: `%wsdir/src` / `%wsdir/env` / `%wsdir/var`.
there could be multiple agents running in parallel and the directories should be strictly considered as read-only.
in particular:
 - dont modify source in %wsdir/src repo
 - dont install editable packages into venv

# rule:

following directories may be freely used by agents on their purposes:

 - %wsdir/wip/%agent/...            - make worktrees/clones as needed and commit into
 - %wsdir/tmp/llmdev/%agent/...     - may be used to keep arbitrary artifacts/state
 - ~/llmdev/www/%wstag/%agent/...   - may be used to keep html reports (dir is served)

created branches should follow `%agent/<name>` pattern. worktree for the branch is `%wsdir/wip/%agent/<name>`.

# rule:

if `.pre-commit-config.yaml` is present. use `pre-commit` to run lints. it is required to activate virtual environment prior to `pre-commit` run.
not just invoke `%wsdir/env/bin/pre-commit`. it is required to make sure commands running from pre-commit configuration use virtual environment.
file `./pyproject.toml` provides canonical linter configuration for the project. take into account when runnings lints for your probes and worktrees.
