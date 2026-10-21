---
name: data-analytics
description: Define product metrics, instrument events, analyze funnels, cohorts, retention and experiments, write SQL, and turn data into decisions. Use for KPI trees, metrics reviews, A/B test readouts, event taxonomy, dashboards, and "why did this metric move".
---

# Data Analytics for PMs

Start from the decision, then the question, then the metric, then the query. Show assumptions and caveats with every number.

## Workflow

1. **Clarify the decision** the analysis supports and the audience.
2. **Define metrics precisely:** numerator, denominator, window, population, exclusions. Write it as a spec.
3. **Check data quality:** duplicates, nulls, bot traffic, timezone, tracking changes, late-arriving data.
4. **Analyze** (below), segmenting before concluding. Check for Simpson's paradox.
5. **Conclude with a recommendation**, confidence level, and what would change your mind.

## Metric design

- **North star** + **input metrics** tree (breadth, depth, frequency, efficiency).
- Pair every metric with a **guardrail** (e.g., conversion up, support tickets flat).
- Prefer rates and cohort-based metrics over cumulative totals.
- Classic sets: HEART (Happiness, Engagement, Adoption, Retention, Task success), AARRR, SaaS (MRR, NRR, churn, CAC payback).

## Event tracking plan

Table: event name (object_action, snake_case), trigger, properties (type, example), user/account identifiers, owner, status. Track the activation event, key value moments, and monetization steps. Keep a naming convention and a change log.

## Core analyses

- **Funnel:** step conversion, time between steps, drop-off by segment.
- **Cohort retention:** group by signup week, plot % active by period; look for a flattening curve (product-market fit signal).
- **Segmentation:** plan, channel, role, company size, device.
- **Root-cause of a metric move:** decompose (volume x rate x mix), check instrumentation, release timeline, seasonality, then segments.
- **LTV/CAC:** use observed retention, not guesses; discount cash flows.

## Experiments

Pre-register hypothesis, primary metric, MDE, sample size, duration, stopping rule. At readout report: effect size with confidence interval, p-value or posterior, guardrails, segment effects (flagged as exploratory), and decision. Do not peek-and-stop; correct for multiple comparisons. If underpowered, say "inconclusive", not "no effect".

## SQL helper patterns

```sql
-- Weekly retention by signup cohort
WITH cohorts AS (
  SELECT user_id, DATE_TRUNC('week', MIN(event_time)) AS cohort_week
  FROM events WHERE event_name = 'signup' GROUP BY 1
), activity AS (
  SELECT DISTINCT user_id, DATE_TRUNC('week', event_time) AS active_week
  FROM events WHERE event_name = 'core_action'
)
SELECT c.cohort_week,
       DATE_DIFF('week', c.cohort_week, a.active_week) AS weeks_since,
       COUNT(DISTINCT a.user_id) * 1.0 / COUNT(DISTINCT c.user_id) AS retention
FROM cohorts c LEFT JOIN activity a USING (user_id)
GROUP BY 1, 2 ORDER BY 1, 2;
```

Adapt dialect (BigQuery, Snowflake, Postgres). Always ask for table schemas before writing production queries.

## Dashboards

One question per dashboard; top row = headline metrics with trend and target; below = breakdowns. Label definitions, data freshness, and owner.

## Outputs

Metric spec, tracking plan, KPI tree, SQL queries, analysis memo (finding, evidence, recommendation, caveats), experiment readout, weekly metrics review.

## Pitfalls

Correlation as causation, averaging averages, survivorship bias, vanity metrics, p-hacking, changing definitions silently.
