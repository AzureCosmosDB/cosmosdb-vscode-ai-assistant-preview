# Azure Cosmos DB VS Code AI Assistant (Private Preview)

This repository hosts private preview guidance and release assets for testing natural language to query capabilities in the Azure Cosmos DB VS Code extension, including the `@cosmosdb` chat participant experience.

This preview is designed for customer and end-user validation, feedback collection, and scenario testing.

## Preview Scope

The preview package is focused on validating:

- Natural language to NoSQL query generation from the Query Editor.
- Query explanation and query edit flows.
- `@cosmosdb` chat participant commands:
	- `/generateQuery`
	- `/explainQuery`
	- `/editQuery`
	- `/question`
	- `/help`
- Query-aware assistance using schema sampling and query history context.

## Quick Start

1. Download the private preview artifacts from the release page.
2. Install the provided VS Code extension `.vsix`.
3. Ensure GitHub Copilot Chat is enabled in VS Code.
4. Connect to an Azure Cosmos DB NoSQL account using the extension.
5. Open Query Editor and test generation/explanation flows.
6. Open Chat and test `@cosmosdb` command and natural language flows.

Detailed steps are in:

- [Installation Guide](docs/INSTALLATION.md)
- [Test Plan](docs/TESTING.md)
- [Troubleshooting Guide](docs/TROUBLESHOOTING.md)

## Downloads

Release files should be published from GitHub Releases and mirrored in `downloads/` metadata for traceability.

Expected core artifact:

- `vscode-cosmosdb-0.33.3.vsix`

See:

- [Downloads Index](downloads/README.md)
- [Preview Manifest](preview-manifest.json)

## Suggested Validation Matrix

- VS Code Stable and VS Code Insiders.
- Windows, macOS, and Linux where available.
- Copilot available and Copilot unavailable/disabled.
- Basic and complex JSON schema containers.
- New user flow and returning user flow with query history.

## Security And Data Handling Notes

- The feature may sample container schema to improve query generation quality.
- Keep test datasets non-sensitive for preview testing.
- Validate your organization policy for AI assistant usage before onboarding production-like data.
- Review [SECURITY.md](SECURITY.md) and [docs/TESTING.md](docs/TESTING.md) prior to testing.

## Feedback

Please use GitHub Issues in this repository for:

- Bug reports
- Incorrect query generation/explanation results
- UX feedback for Query Editor AI and `@cosmosdb`
- Security and compliance concerns (follow `SECURITY.md` for vulnerability reporting)

Include:

- Extension version
- VS Code version
- OS
- Repro steps
- Prompt/query used (sanitized)
- Expected versus actual behavior

## Build And Release Automation

This repository includes build validation files for preview packaging:

- `.github/workflows/private-preview-package.yml`
- `scripts/validate-preview-manifest.ps1`
- `scripts/build-private-preview.ps1`

Use these to enforce artifact consistency for each private preview drop.

## Contributing

This project welcomes contributions and suggestions. Most contributions require you to agree to a Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us the rights to use your contribution. For details, visit [https://cla.opensource.microsoft.com](https://cla.opensource.microsoft.com).

When you submit a pull request, a CLA bot will automatically determine whether you need to provide a CLA and decorate the PR appropriately (for example, status check and comment). Simply follow the instructions provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft trademarks or logos is subject to and must follow [Microsoft's Trademark and Brand Guidelines](https://www.microsoft.com/legal/intellectualproperty/trademarks/usage/general). Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship. Any use of third-party trademarks or logos are subject to those third-party policies.
