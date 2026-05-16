# vars:

prompts may contain following variables. expand them:

%agent -- current agent slug.
%system -- path to current project root instructions.

example of project slugs:
 * OpenAI Codex: `codex`
 * Anthropic Claude: `claude`

project root is a directory containing top level project %system instructions.
all paths given in the global, skills, project local instructions are relevant to project root.
even if current directory is subdirectory of the project root and contains `.git` directory.

# rule:

on demand agent may use `./MEMORY.md` for current task inputs.
agent may use `./.%agent` directory from the root of the project.
i.e. `./.claude` for claude agents, `./.codex` for codex agents, etc...
on demand agent may use `./.%agent/MEMORY.md` for current task oututs.
