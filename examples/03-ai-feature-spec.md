# Example: ai-shipping-kit

**Prompt:** "Spec an AI feature that drafts replies to customer support tickets."

*Fictional product and numbers, to show the output shape.*

## User job and success metric
Support agents resolve tickets faster. Metric: median handle time down 25% with no drop in CSAT.

## Fit check
Good: high volume, language task, a human reviews every draft. Not for refunds or legal replies (route to humans).

## Approach
RAG over the help center and past resolved tickets, with citations. Start with prompt plus retrieval; consider fine-tuning only if tone consistency plateaus.

## Failure modes
| Failure | Severity | Mitigation |
|---|---|---|
| Invents a policy | High | Answer only from retrieved sources; show them; block send if none found |
| Wrong tone | Medium | Style guide in prompt, edit before send |
| Leaks another customer's data | High | Retrieval scoped per account, PII filter |

## Eval plan
120 real tickets (anonymized), rated on correctness (0-2), groundedness (0-2), tone (0-1). Pass: 85% score at least 4/5, zero high-severity failures. Re-run on every prompt or model change.

## Budgets
Latency p95 under 6 seconds with streaming. Cost target under $0.03 per draft; use prompt caching for the system prompt and a smaller model for classification.

## UX
Draft appears in the reply box with sources; agent edits or discards; thumbs up/down logged; one-click "write manually".

## Rollout
Dogfood with 5 agents, then 20%, then 100%, with a kill switch. Weekly review of 50 sampled drafts.
