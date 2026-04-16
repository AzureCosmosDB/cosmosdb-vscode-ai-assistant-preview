param(
    [string]$ManifestPath = "preview-manifest.json"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $ManifestPath)) {
    throw "Manifest file not found: $ManifestPath"
}

$manifest = Get-Content $ManifestPath -Raw | ConvertFrom-Json

if (-not $manifest.previewName) {
    throw "Manifest is missing previewName"
}

if (-not $manifest.version) {
    throw "Manifest is missing version"
}

if (-not $manifest.artifacts -or $manifest.artifacts.Count -eq 0) {
    throw "Manifest must include at least one artifact"
}

foreach ($artifact in $manifest.artifacts) {
    if (-not $artifact.name) {
        throw "Each artifact must include name"
    }

    if (-not $artifact.path) {
        throw "Artifact '$($artifact.name)' is missing path"
    }

    if (-not (Test-Path $artifact.path)) {
        throw "Artifact file not found: $($artifact.path)"
    }

    if (-not $artifact.sha256 -or $artifact.sha256 -eq "REPLACE_WITH_SHA256") {
        throw "Artifact '$($artifact.name)' has placeholder SHA256"
    }

    if ($artifact.sha256 -notmatch '^[a-fA-F0-9]{64}$') {
        throw "Artifact '$($artifact.name)' has invalid SHA256 format"
    }

    $hash = (Get-FileHash -Path $artifact.path -Algorithm SHA256).Hash
    if ($hash.ToLowerInvariant() -ne $artifact.sha256.ToLowerInvariant()) {
        throw "SHA256 mismatch for '$($artifact.name)'. Expected $($artifact.sha256), got $hash"
    }
}

Write-Host "Preview manifest validation passed."
