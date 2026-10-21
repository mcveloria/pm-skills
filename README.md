# PM Skills for Claude

A product management skill set for [Claude Code](https://claude.com/claude-code). Nine skills cover the product lifecycle, from finding the problem to shipping, launching, and measuring. Each skill is a `SKILL.md` that Claude loads automatically when your request matches its description.

Ask in plain language. For example:

- "Plan five customer interviews about why trial users churn."
- "Size the market for an AI meeting-notes tool for recruiters."
- "Draft a PRD for bulk export, with acceptance criteria."
- "Why did week-4 retention drop last month?"
- "Build a launch plan for our new pricing tier."

See what the output looks like in [`examples/`](examples/): an interview guide, a PRD, and an AI feature spec (fictional data).

## The skills

| Skill | What it does | Typical outputs |
|---|---|---|
| [`product-discovery`](skills/product-discovery/SKILL.md) | Frames problems, plans and synthesizes interviews, maps opportunities, designs assumption tests | Problem statement, interview guide, opportunity tree, assumption map |
| [`market-research`](skills/market-research/SKILL.md) | Sizes markets, profiles competitors, defines segments and personas | TAM/SAM/SOM, competitor table, positioning map, battlecard |
| [`marketing-growth`](skills/marketing-growth/SKILL.md) | Improves acquisition, activation, retention, and revenue with loops, channels, and experiments | Growth model, channel scorecard, experiment backlog, lifecycle plan |
| [`product-strategy`](skills/product-strategy/SKILL.md) | Sets vision, positioning, OKRs, priorities, and roadmaps | Strategy doc, OKRs, scored backlog, Now/Next/Later roadmap |
| [`data-analytics`](skills/data-analytics/SKILL.md) | Defines metrics, tracking plans, cohort and funnel analyses, experiment readouts, SQL | Metric spec, KPI tree, SQL, analysis memo |
| [`pm-toolkit`](skills/pm-toolkit/SKILL.md) | Everyday PM documents and templates | PRD, user stories, stakeholder update, decision log, retro |
| [`execution`](skills/execution/SKILL.md) | Delivers on time: sprints, risks, scope, launch readiness | Sprint plan, RAID log, readiness checklist, post-launch review |
| [`go-to-market`](skills/go-to-market/SKILL.md) | Plans launches: ICP, messaging, pricing, channels, enablement | GTM plan, messaging house, pricing options, launch calendar |
| [`ai-shipping-kit`](skills/ai-shipping-kit/SKILL.md) | Scopes, evaluates, and launches AI features | AI feature spec, eval plan, guardrails, cost estimate, rollout plan |

## How they fit together

```
Discovery  ->  Strategy  ->  Execution  ->  Go-to-Market  ->  Growth
    ^             ^             |                 |              |
Market Research   |        PM Toolkit        AI Shipping Kit     |
    ^             |                                              |
    +----------- Data Analytics <------------------------------- +
```

Data analytics closes the loop. What you learn from launches and experiments feeds back into discovery and strategy.

## Install

New to Claude skills? Follow the step-by-step [Getting Started guide](GETTING_STARTED.md).

Requirements: Claude Code and `git`.

```bash
git clone https://github.com/mcveloria/pm-skills.git
cd pm-skills
bash install.sh
```

The script copies each skill folder into `~/.claude/skills/`. Set `CLAUDE_SKILLS_DIR` to install somewhere else, such as a project's `.claude/skills/` folder to share the skills with a team.

Restart Claude Code afterwards. To install only some skills, copy their folders by hand:

```bash
cp -R skills/product-discovery skills/pm-toolkit ~/.claude/skills/
```

To update, run `git pull` and `bash install.sh` again.

## Repository layout

```
pm-skills/
├── skills/
│   ├── product-discovery/SKILL.md
│   ├── market-research/SKILL.md
│   ├── marketing-growth/SKILL.md
│   ├── product-strategy/SKILL.md
│   ├── data-analytics/SKILL.md
│   ├── pm-toolkit/SKILL.md
│   ├── execution/SKILL.md
│   ├── go-to-market/SKILL.md
│   └── ai-shipping-kit/SKILL.md
├── install.sh
├── LICENSE
└── README.md
```

## Customizing

Each `SKILL.md` has YAML frontmatter and instructions:

```markdown
---
name: product-discovery
description: When Claude should use this skill, with trigger phrases.
---

# Instructions, workflow, templates...
```

- Edit the `description` to change when a skill triggers.
- Add your company's templates, metric definitions, or terminology directly into the body.
- Add a new skill by creating `skills/<name>/SKILL.md`; `install.sh` picks it up.

## Notes on use

- The skills give Claude frameworks and templates. They don't supply data. Market sizes, competitor facts, and metrics come from sources you provide or from research, and Claude is instructed to state sources and flag assumptions.
- Review outputs before sharing. Numbers, pricing, and legal or compliance points need a human check.
- Connect data tools (analytics, CRM, docs) to Claude for the best results with `data-analytics` and `market-research`.

## Contributing

Issues and pull requests are welcome. Keep skills focused: a clear trigger description, a step-by-step workflow, templates, and common pitfalls.

## License

MIT. See [LICENSE](LICENSE).
