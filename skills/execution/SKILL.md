---
name: execution
description: Deliver product work: sprint and release planning, backlog grooming, working with engineering and design, dependency and risk management, launch readiness, and post-launch review. Use for sprint plans, project plans, RAID logs, Definition of Ready/Done, scope-cut decisions, and "how do we ship this on time".
---

# Execution

Predictable delivery comes from clear outcomes, small batches, visible risks, and fast decisions.

## Workflow

1. **Shape the work:** confirm the problem, success metric, and appetite (time budget). Cut scope to fit appetite, not the reverse.
2. **Break down:** epics → stories, each independently shippable and testable. Identify the thinnest vertical slice that delivers value.
3. **Check readiness** (Definition of Ready): clear acceptance criteria, designs, dependencies identified, analytics defined, estimable.
4. **Plan the sprint:** set a sprint goal first, then pull stories to match capacity (use trailing velocity; reserve 15-20% for bugs and support).
5. **Run the cadence:** daily standup (blockers only), mid-sprint scope check, demo, retro.
6. **Manage risk:** keep a RAID log (Risks, Assumptions, Issues, Dependencies) reviewed weekly.
7. **Launch and learn:** go through the readiness checklist, then a post-launch review against the success metric.

## Sprint plan template

```
Sprint goal:
Capacity (people x days, minus PTO):
Committed stories (points, owner):
Stretch:
Risks / dependencies:
Definition of Done: code reviewed, tests passing, analytics verified, docs updated, accepted by PM/design
```

## RAID log columns

ID, type, description, probability, impact, owner, mitigation, due, status.

## Scope management

When behind: cut scope before cutting quality or extending the date. Use MoSCoW (Must/Should/Could/Won't) and ask "what is the smallest version that still tests the hypothesis?" Make trade-offs visible with a one-line option table: option, impact on date, impact on value, recommendation.

## Estimation

Use relative sizing and ranges. Express forecasts as probabilities ("80% by Mar 14") using throughput or Monte Carlo from past cycle times. Re-forecast every sprint. Never convert story points to promised dates.

## Working with engineering and design

Bring problems and constraints early; leave the "how" to the team. Hold a kickoff covering why, users, metric, non-goals, and open questions. Be available for fast answers; unblock within a day. Involve engineers in discovery.

## Launch readiness checklist

- Success metric and dashboard live
- Feature flag, rollout plan, rollback plan
- QA, performance, security and privacy review passed
- Support/sales/CS briefed, docs and help center updated
- Legal/compliance sign-off if needed
- Comms scheduled; on-call and monitoring assigned
- Go/no-go meeting with named decision owner

## Post-launch review (2-4 weeks later)

Metric vs target, qualitative feedback, bugs, what we learned, what to iterate, what to retire.

## Pitfalls

Unclear priorities mid-sprint, hidden dependencies, scope creep via "small asks", hero culture, measuring output instead of outcomes, skipping retros.
