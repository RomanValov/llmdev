---
name: topics
description: on demand instructions for topic scoped work
---
should be invoked as `topics %topic` to infer `%topic` name.
otherwise topic name should be clean from surrounding context.

it is a scoped topic project work. should use following directories instead of default ones:

* %wsdir/wip/topics/%topic/master       -- primary project source.
* %wsdir/wip/topics/%topic/%agent/...   -- make worktrees/clones as needed and commit into.
* %wsdir/llm/topics/%topic/%agent/...   -- may be used to keep arbitrary artifacts/state.
