---
name: rebase
description: on demain skill to rebuild commit history
---
should be given commits which history is to be rebuilt.

consider approach iterative commit reposition (one history position at time) to avoid being
overwhelmed with conflicted changes. but choose way which is faster and efficient.
preserve commit semantic meaning and boundaries on rebases.
it is important because hunks between commits could conflict.
ensure every commit on history is clean and correct (by lints and tests).
at least no issues introduced by current rebase task.
