# Getting Started: PM Skills for Claude

A step-by-step guide for product managers who are new to Claude skills. No coding experience needed.

## What is a skill?

A skill is a set of instructions that Claude loads when your request matches it. Think of it as a playbook. Ask "Draft a PRD for bulk export" and Claude follows the PRD template and checklist from the `pm-toolkit` skill instead of improvising.

This repo has nine skills: `product-discovery`, `market-research`, `marketing-growth`, `product-strategy`, `data-analytics`, `pm-toolkit`, `execution`, `go-to-market`, `ai-shipping-kit`.

## Choose your path

| You use... | Go to |
|---|---|
| Claude Code (terminal or desktop app) | [Path A](#path-a-claude-code) |
| Claude.ai in the browser | [Path B](#path-b-claudeai) |

---

## Path A: Claude Code

### Step 1. Install Claude Code
Follow the setup instructions at https://claude.com/claude-code. Open it once to confirm it runs.

### Step 2. Open a terminal
- **Mac:** press Cmd+Space, type "Terminal", press Enter.
- **Windows:** open "PowerShell" or "Git Bash".

### Step 3. Download the skills
```bash
git clone https://github.com/mcveloria/pm-skills.git
cd pm-skills
```
No `git`? On Mac, running the command prompts you to install it. On Windows, install it from https://git-scm.com. Or click **Code, Download ZIP** on the GitHub page and unzip it.

### Step 4. Install the skills
**Mac / Linux:**
```bash
bash install.sh
```
You should see nine lines like `Installed pm-toolkit`.

**Windows (or if the script fails):** copy every folder inside `skills/` into `C:\Users\<you>\.claude\skills\`. On Mac the destination is `~/.claude/skills/`. Create the folder if it doesn't exist.

### Step 5. Restart Claude Code
Quit it completely and open it again. Skills are loaded at startup.

### Step 6. Try it
Type a real request:
> Plan five customer interviews to understand why new users stop using our app after week one.

Claude should follow the `product-discovery` workflow: a problem statement, a screener, and an interview guide.

### Install for your whole team (optional)
Copy the skill folders into your project's `.claude/skills/` folder and commit them. Everyone who opens the project gets the skills.

---

## Path B: Claude.ai

Custom skills on Claude.ai depend on your plan and the current settings layout, so check Anthropic's help center if a menu below has moved.

1. Download the repo: on the GitHub page click **Code, Download ZIP**, then unzip it.
2. Go to **Settings, Capabilities** (or **Customize, Skills**) in Claude.ai and look for **Skills**.
3. Create a ZIP of one skill folder, for example `skills/pm-toolkit`, so the `SKILL.md` file sits inside that folder.
4. Upload the ZIP and switch the skill on.
5. Repeat for each skill you want.
6. Start a new chat and make a request that matches the skill.

---

## How to use the skills well

1. **Give context.** Say who the customer is, what the product does, and the numbers you have. Compare:
   - Weak: "Write a PRD."
   - Strong: "Write a PRD for bulk invoice export. Users are freelancers. 41 support tickets last quarter asked for it. We have two engineers for one sprint."
2. **Name the output you want.** "Give me a table", "keep it to one page", "write it as a Notion doc".
3. **Iterate.** Reply with "make the goals measurable", "cut the non-goals to three", "add edge cases".
4. **Ask Claude to flag assumptions.** Skills tell Claude to separate facts from guesses. Check any number it gives you.
5. **Chain skills** through a project:
   discovery → strategy → PRD (`pm-toolkit`) → sprint plan (`execution`) → launch plan (`go-to-market`) → metrics review (`data-analytics`).

## Your first week

| Day | Try this |
|---|---|
| 1 | Install, then run `pm-toolkit`: "Turn these meeting notes into action items and a stakeholder update." |
| 2 | `product-discovery`: build an interview guide for your next customer call. |
| 3 | `data-analytics`: write the metric definition for your main KPI and a tracking plan. |
| 4 | `product-strategy`: draft OKRs and score your backlog with RICE. |
| 5 | `go-to-market` or `ai-shipping-kit`: plan your next launch. Compare Claude's output with what you already do. |

## Check that a skill is active

- Ask: "Which skills do you have available?" You should see the PM skills listed.
- Use a prompt close to the skill's description. Sample outputs are in [`examples/`](examples/).

## Troubleshooting

| Problem | Fix |
|---|---|
| `permission denied` running the installer | Use `bash install.sh`, not `./install.sh` |
| Skills don't show up | Restart Claude Code fully; check that each folder is directly under `~/.claude/skills/` and contains `SKILL.md` |
| Skill doesn't trigger | Name the task directly ("use the go-to-market skill to...") or reword closer to the skill's description |
| Output feels generic | Add real context: customer, numbers, constraints, deadline |
| Update to the latest version | In the `pm-skills` folder run `git pull`, then `bash install.sh`, then restart |

## Make them your own

Open any `skills/<name>/SKILL.md` in a text editor. Add your company's templates, terminology, and metric definitions, then reinstall. Editing the `description` line at the top changes when the skill triggers.

## Share feedback

Open an issue at https://github.com/mcveloria/pm-skills/issues with what worked, what didn't, and which skills you'd like added.

Skills give Claude frameworks, not facts. Verify numbers, pricing, and legal or compliance points before sharing.
