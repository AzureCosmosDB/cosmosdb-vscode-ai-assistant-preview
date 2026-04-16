# Downloads Index

This folder tracks metadata and structure for private preview artifacts.

## Expected Artifact Naming

- `vscode-cosmosdb-0.33.3.vsix`

## Distribution Model

1. Publish preview artifacts in GitHub Releases.
2. Update `preview-manifest.json` with artifact names and checksums.
3. Validate using `scripts/validate-preview-manifest.ps1`.
4. Optionally package all release collateral with `scripts/build-private-preview.ps1`.

## Notes

- Do not commit customer data or environment-specific files.
- Keep artifact names immutable once shared with preview users.
