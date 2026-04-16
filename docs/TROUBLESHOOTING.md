# Troubleshooting

## Copilot Chat Is Not Available

- Verify GitHub Copilot and GitHub Copilot Chat extensions are installed.
- Confirm you are signed in with an account that has Copilot access.
- Reload VS Code.
- Retry in a new VS Code window.

## @cosmosdb Command Is Not Recognized

- Confirm private preview VSIX is installed and active.
- Check for extension activation errors in the Output panel.
- Run `Developer: Reload Window` and retry.

## Generate/Explain Returns Error

- Verify a container context is selected in Cosmos DB Query Editor.
- Ensure query is valid before Explain/Edit flows.
- Retry with a simpler prompt.
- Capture logs and open a GitHub issue.

## Query Does Not Match Intent

- Rephrase with explicit filters, fields, and sort requirements.
- Mention the expected field names if known.
- Use follow-up edit prompt to refine query output.

## Query Executes But Returns Unexpected Results

- Validate field names and data types in your container.
- Run a basic `SELECT TOP 10 * FROM c` sanity query.
- Confirm partition key assumptions in your query.

## High RU Consumption During Testing

- Use smaller test datasets where possible.
- Limit query scope with selective filters.
- Avoid broad cross-partition queries during rapid iteration.

## Reporting Checklist

When opening an issue, include:

- Build version
- VS Code version
- OS
- Prompt/query used (sanitized)
- Expected and actual behavior
- Relevant logs and screenshots
