---
name: sanity
description: on demand instructions for shallow changes check
---
the skill is intended for quick shallow check of given changes.
it is implied to be called often during edit-lint-test workflows.

the skill should not run agentic operation loops except for git operations to get changes for the check.

1) define changes:

    - should be given by the user in the context of skill invocation
    - otherwise check uncommited changes if present else HEAD commit

2) analyze changes:

analyze given changes and detect issues which:

    - obvious only from the diffs of the given changes. dont do history / repository research;
    - require obvious trivial fix. no judgement / no choice among multiple possible solutions;

examples (but not limited to):

    * typos
    * stray symbols
    * missing additions/deletions
    * copy-paste errors
    * wrong operations order
    * change inconsistencies
    * inverted conditions
    * leftover debug code
    * unnecessary code
    * incorrect/deprecated/suboptimal/non-idiomatic syntax


consider something linters would catch but have not caught.

3) report issues:

for each found issue show show commentary and proposed diff.
