# Example: pm-toolkit

**Prompt:** "Draft a PRD for bulk invoice export."

*Fictional product and numbers, to show the output shape.*

## Title: Bulk invoice export | Owner: PM | Status: Draft

## 1. Problem
Accountants of our freelancer customers request invoices monthly; 41 support tickets last quarter asked for "download all". Users export one at a time.

## 2. Goals and success metrics
- Cut export-related tickets from 41 to under 10 per quarter
- 30% of active accounts use bulk export at least once in 60 days

## 3. Non-goals
Accounting-software integrations, custom report builders.

## 4. Requirements
| ID | Requirement | Priority |
|---|---|---|
| R1 | Select invoices by date range, client, or status | P0 |
| R2 | Export as ZIP of PDFs and a CSV summary | P0 |
| R3 | Exports over 200 invoices run in the background and email a link | P1 |
| R4 | Download link expires after 7 days | P1 |

## 5. User story
As a freelancer, I want to download all of last month's invoices at once, so that I can send them to my accountant.

**Acceptance criteria**
- Given I have filtered invoices for March, when I click Export, then I receive a ZIP containing one PDF per invoice plus `summary.csv`.
- Given more than 200 invoices match, when I click Export, then I see "We'll email you the link" and receive it within 10 minutes.

## 6. Edge cases
No invoices match; deleted client; invoice currency mix in CSV; link opened after expiry.

## 7. Analytics
`export_started`, `export_completed` (count, duration), `export_downloaded`.

## 8. Rollout and risks
Feature flag, 10% then 100% over two weeks. Risk: large exports load the PDF service; cap at 2 concurrent per account.

## 9. Open questions
Should the CSV follow a standard accounting format? (Decision needed from Finance by Friday.)
