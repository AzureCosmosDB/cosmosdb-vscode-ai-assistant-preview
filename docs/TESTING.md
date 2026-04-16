# Test Plan

This test plan is for end users and customer evaluators validating private preview quality.

## Test Environment Matrix

Validate at minimum:

- OS: Windows, macOS, Linux
- VS Code: Stable and Insiders
- Copilot: available and unavailable
- Data shape: simple schema and nested schema containers

## Pre-Test Setup

1. Install preview VSIX (see `docs/INSTALLATION.md`).
2. **Provision a Cosmos DB NoSQL account** — use one of the two options below:
   - **Azure account (recommended):** Create or reuse an Azure Cosmos DB for NoSQL account in the Azure Portal. Create a database (e.g. `testdb`) and a container (e.g. `testdata`, partition key `/type`).
   - **Local emulator:** Install the [Azure Cosmos DB Emulator](https://learn.microsoft.com/azure/cosmos-db/emulator) and start it. Connect from VS Code using the emulator endpoint (`https://localhost:8081`) and the well-known emulator key. Create a database and container as above.
3. **Import sample data:** Upload the documents from `examples/sample-data.json` into the container using the Data Explorer in the Azure Portal, the emulator's Data Explorer, or the VS Code extension's upload feature.
   The dataset includes orders, users, products, invoices, and work items that cover every prompt in `examples/nl-prompts.md`.
4. Confirm query execution works without AI.
5. Open VS Code Output panel for Azure Cosmos DB extension logs.

## Scenario 1: Generate Query from Natural Language

1. Open Query Editor.
2. Enter natural language prompt in AI generate flow.
3. Verify:
   - Query is syntactically valid.
   - Query aligns with intent.
   - Query is inserted in editor.
4. Run query and verify expected results.

Pass criteria:

- Generated query executes without manual repair in common scenarios.

## Scenario 2: Explain Existing Query

1. Paste a non-trivial query.
2. Run Explain.
3. Verify explanation includes:
   - Filters
   - Projection
   - Ordering and pagination semantics where relevant

Pass criteria:

- Explanation is accurate and understandable for a database practitioner.

## Scenario 3: Edit/Optimize Query

1. Start with a valid base query.
2. Ask to optimize or modify intent.
3. Verify edited query preserves intent and validity.

Pass criteria:

- Edits are coherent and executable.

## Scenario 4: @cosmosdb Chat Participant Commands

Run each command:

- `/help`
- `/generateQuery`
- `/explainQuery`
- `/editQuery`
- `/question`

Pass criteria:

- Commands are recognized.
- Responses map to command purpose.
- If action buttons are shown, they apply changes correctly.

## Scenario 5: Intent Detection (No Slash Command)

1. Use natural prompts without slash commands.
2. Verify the assistant routes to generation/explanation/question behavior correctly.

Pass criteria:

- Intent routing is mostly correct for common asks.

## Scenario 6: Schema Sampling And History Context

1. Generate query in a fresh container context.
2. Execute and regenerate with follow-up prompt.
3. Verify follow-up responses improve with context.

Pass criteria:

- Assistant uses schema/history context without exposing document payloads.

## Negative And Resilience Tests

- Copilot unavailable: graceful error and recovery guidance.
- Unsupported prompt: safe and useful fallback response.
- Invalid source query for explain/edit: clear correction guidance.

## Data Collection For Bug Reports

Collect and include:

- Extension version
- VS Code version
- OS
- Prompt/query (sanitized)
- Logs from Output panel
- Screenshot or recording (if possible)

## Exit Criteria For Preview Milestone

- All core scenarios pass on primary OS matrix.
- No high-severity blocking defects.
- Known limitations documented in release notes.
- At least one successful end-to-end user journey per target persona.
