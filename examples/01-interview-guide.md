# Example: product-discovery

**Prompt:** "Plan customer interviews about why trial users of our invoicing app stop after week one."

*Fictional product ("InvoiceFlow") and data, to show the output shape.*

## Problem statement
Freelancers who start an InvoiceFlow trial struggle to send their first real invoice within a week, because setup (client details, tax, branding) takes longer than sending an invoice the old way, which costs us 62% of trials before day 7.

## Desired outcome
Raise "first invoice sent within 7 days" from 38% to 50%.

## Riskiest assumption
Users abandon because setup is slow, not because they lack invoices to send. **Test first.**

## Screener
- Signed up in the last 30 days, did not send an invoice (6 people)
- Signed up and did send an invoice (3 people, for contrast)

## Interview guide (30 min)
1. Context: what work do you do, how many clients do you bill each month?
2. Walk me through the last time you invoiced a client, step by step.
3. What made you try InvoiceFlow? What happened in your first session?
4. What did you do instead when you stopped? (Workaround and its cost.)
5. Who else is involved in getting you paid?
6. Wrap: who else should I talk to?

## Evidence strength tags
Quote = strong, observed behavior = strong, opinion = weak.

## Next test
If 4+ of 6 name setup friction, test a "send in 60 seconds" onboarding with a prefilled sample client.
