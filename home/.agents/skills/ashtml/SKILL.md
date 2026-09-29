---
name: ashtml
description: on demand reporting as html document
---
for current session prepare html report at `~/llmdev/www/%wstag/%agent/%topic/`.

the report should be suitable for further amendments and provide page based navigation.

the report should be available in light and dark color schemes (use system as default).

use svg diagrams where reasonable. dont serve other artifacts (such as evidence or probes).

the `~/llmdev/www` directory is served as `http://$(hostname):8000/...`.
