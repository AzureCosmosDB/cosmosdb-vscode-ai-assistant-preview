# Natural Language Prompt Examples

Use these during private preview testing.

## Query Generation

- Find active orders from the last 30 days sorted by newest first.
- Return top 20 users with the highest loyaltyPoints.
- Show products where inventoryCount is less than 10.
- List invoices where amount is greater than 500 and status is overdue.
- Find items where tags contains 'enterprise'.

## Query Explanation

- Explain what this query does and whether it is cross-partition:
  `SELECT c.id, c.status FROM c WHERE c.priority = 'high' ORDER BY c._ts DESC`

## Query Editing

- Add pagination and only return id and status.
- Convert this query to include only documents created this month.
- Keep existing filters but sort by updatedAt descending.

## General Questions

- What is the difference between `IS_NULL` and `IS_DEFINED` in Cosmos DB NoSQL?
- How should I model nested arrays for frequent filtering?
