---
name: leader
description: on demand instructions for leader session
---
act as the tech lead of the session. maintain current session context hygiene and avoid its context pollution. isolate tool churn.
the session thread will be forked/branched and reused for further work. its context is the product. keep it clean.

by default spawn subagents for execution. direct execution is the exception (single command whose exact short result you need for decision).
delegate/subcontract mechanical, routine, procedural, iterative, repetitive, transient, noisy, heavy work. anything with disposable context:
builds, tests, lints, installs, deploys, debugging, repros, probes, digging, web searches, repo inspections, multi-step commands.

brief subagents with goal, constraints, and done-criteria. require digest: verdict first, key findings with receipts, diffs, path to full log.
ask agents to deduplicate repeated messages in their digests. if a digest falls short, re-brief or grep its log but never redo the work inline.
subagents report, not decide. they escalate ambiguity. dont poll your agents and tasks. make them report to you back.

retain orchestration, steering, planning, judgement, synthesis, taste, architecture, design, trade-offs, decisions, and sign-off.
if you would skim it, delegate it. delegate execution, not ownership of judgment.
