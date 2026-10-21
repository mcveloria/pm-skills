---
name: ai-shipping-kit
description: Scope, build, evaluate, and launch AI-powered product features: use-case selection, model and architecture choices, prompt and eval design, guardrails, cost and latency budgets, human-in-the-loop UX, and AI-specific launch and monitoring. Use for LLM features, agents, RAG, copilots, and AI PRDs.
---

# AI Shipping Kit

AI features are probabilistic. Ship by defining "good" up front, measuring it continuously, and designing the UX for the failure cases.

## Workflow

1. **Pick the use case.** Good fits: high-volume language/judgment tasks, tolerance for occasional errors, human review available, clear value if 80% right. Poor fits: zero-error-tolerance tasks with no review, or problems a rule or search solves.
2. **Write the AI spec:** user job, inputs, desired output, quality bar, failure modes, human-in-the-loop points, latency and cost budget, data sensitivity.
3. **Choose the approach** (simplest that works): prompt only → prompt + few-shot → RAG (knowledge changes often, need citations) → tool use/agents (multi-step actions) → fine-tuning (style/format at scale, after the others plateau).
4. **Build an eval set first:** 50-200 real, representative cases with expected outputs or rubrics, including edge cases and adversarial ones. Define metrics (accuracy, groundedness, format validity, refusal correctness, tone) and a pass threshold.
5. **Iterate:** prompt/retrieval/model changes, each scored against the eval set. Use LLM-as-judge only after calibrating against human labels.
6. **Design the UX** for uncertainty: show sources, allow edit/undo, let users give feedback, make it easy to fall back to manual.
7. **Add guardrails:** input validation, prompt-injection defenses, output filters, PII handling, permission checks on tool calls, rate limits, confirmation before irreversible actions.
8. **Launch gradually:** internal dogfood → beta → percentage rollout behind flags, with monitoring and a kill switch.
9. **Monitor and improve:** log inputs/outputs (with privacy controls), sample for human review, track quality, cost, latency, thumbs up/down, escalation rate; feed failures back into the eval set.

## AI feature spec template

```
User job and success metric:
Inputs / context available:
Output format and quality bar:
Top failure modes and their severity:
Human-in-the-loop (who reviews, when):
Model/approach and why:
Eval set (size, source) and thresholds:
Latency budget (p50/p95), cost per request, monthly cap:
Safety, privacy, compliance (PII, data retention, region):
Rollout plan and kill criteria:
```

## Cost and latency

Estimate: `(input tokens x input price + output tokens x output price) x requests/month`. Reduce with prompt caching, shorter context, smaller models for easy steps, routing, batching, and streaming for perceived speed. Check current pricing and model IDs in the provider docs; when using the Claude API, use the `claude-api` skill for up-to-date details.

## Evaluation rubric examples

Correctness (0-2), groundedness in sources (0-2), completeness (0-2), tone/format (0-1), safety (pass/fail). Track regressions per release.

## Risk checklist

Hallucination, prompt injection, data leakage, bias, over-reliance, copyright, vendor lock-in/model deprecation (plan model upgrades and pin versions), and regulatory exposure (e.g., EU AI Act risk tier, sector rules).

## Metrics

Task success rate, acceptance/edit rate, time saved, escalation rate, hallucination rate from audits, cost per successful task, user trust (survey), retention of AI users vs non-users.

## Pitfalls

Demos mistaken for products, no eval set, shipping without a fallback, ignoring cost at scale, treating the model as the moat (data, workflow, and distribution are), skipping red-teaming.
