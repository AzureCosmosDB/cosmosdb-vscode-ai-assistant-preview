# Installation Guide

This guide describes how private preview participants can install and validate the Cosmos DB AI assistant experience in VS Code.

## Prerequisites

- Visual Studio Code `1.103+` (Stable or Insiders)
- Azure account with access to an Azure Cosmos DB NoSQL account
- GitHub Copilot and GitHub Copilot Chat enabled in VS Code
- Preview artifact: `vscode-cosmosdb-0.33.3.vsix`

## 1. Install Preview VSIX

1. Download `vscode-cosmosdb-0.33.3.vsix` from the release page.
2. Open VS Code.
3. Open Extensions view (`Ctrl+Shift+X` / `Cmd+Shift+X`).
4. Select `...` -> `Install from VSIX...`.
5. Select the downloaded file.
6. Reload VS Code when prompted.

## 2. Sign In and Connect to Azure

1. Open the Azure view in VS Code.
2. Sign in with an account that has Cosmos DB access.
3. Expand your subscription and locate your Cosmos DB account.
4. Open a database/container in the Cosmos DB extension Query Editor.

## 3. Verify Copilot Availability

1. Open Chat view in VS Code.
2. Confirm Copilot Chat is available and can respond.
3. If unavailable, sign in to GitHub Copilot and retry.

## 4. Validate Query Editor AI

1. In Query Editor, use the AI entry point.
2. Try a prompt like:

```text
Find active orders created in the last 30 days and sort by createdAt desc
```

3. Verify generated query appears in the editor.
4. Run the query and confirm it executes.
5. Use Explain flow to validate explanation quality.

## 5. Validate @cosmosdb Chat Participant

1. Open Chat.
2. Run:

```text
@cosmosdb /help
@cosmosdb /generateQuery Find documents where status = 'pending'
@cosmosdb /explainQuery SELECT * FROM c WHERE c.status = 'pending'
@cosmosdb /editQuery Add ORDER BY c._ts DESC
@cosmosdb /question What is the difference between IS_DEFINED and IS_NULL?
```

3. Validate responses are relevant and actions (if shown) work as expected.

## 6. Optional Workspace Settings

Create or update `.vscode/settings.json`:

```json
{
  "github.copilot.chat.agent.thinkingTool": true
}
```

Use only settings approved by your organization policy.

## Upgrade to New Preview Build

1. Uninstall old preview extension build.
2. Install the new VSIX.
3. Reload VS Code.
4. Re-run smoke tests from `docs/TESTING.md`.
