# rules

## vars

prompts may contain following variables. expand them:

* %agent -- currentharness name (use env var `$AGENT`. guess if not set).
* %wsdir -- top level project dir / workspace (use env var `$WSDIR`).
* %wstag -- name of the project dir / workspace (use env var `$WSTAG`).

## dirs

following directories may be used on purpose (if available):

* %wsdir/env -- python virtual environment to use.
* %wsdir/src -- primary project source / project dir.
* %wsdir/wip -- alternative clones and git worktrees.
* %wsdir/tmp -- directory for drafts, scratches, probes, helpers and artifacts.
* %wsdir/var -- directory for state persistence such as databases.

## rule:1

multiple agents and users may do work in parallel with you at shared directories.
unless asked by the user do not alter/change content and state of shared directories:

* `%wsdir/src`
* `%wsdir/env`
* `%wsdir/var`

in particular:

* dont modify source in %wsdir/src repo
* dont install editable packages into venv

## rule:2

following directories may be freely used by agents on their purposes:

* %wsdir/wip/%agent/...            - make worktrees/clones as needed and commit into
* %wsdir/tmp/llmdev/%agent/...     - may be used to keep arbitrary artifacts/state
* ~/llmdev/www/%wstag/%agent/...   - may be used to keep html reports (dir is served)

created branches should follow `%agent/<name>` pattern.
worktree for the branch is `%wsdir/wip/%agent/<name>`.

## rule:3

if `.pre-commit-config.yaml` is present. use `pre-commit` to run lints.
it is required to activate virtual environment prior to `pre-commit` run.
directly running `%wsdir/env/bin/pre-commit` won't work due to `system` config entries.
file `./pyproject.toml` provides canonical linter configuration for the project.
take into account when runnings lints for your probes and worktrees.
