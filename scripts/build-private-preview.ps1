param(
    [string]$ManifestPath = "preview-manifest.json",
    [string]$OutputDir = "dist"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $ManifestPath)) {
    throw "Manifest file not found: $ManifestPath"
}

if (-not (Test-Path $OutputDir)) {
    New-Item -Path $OutputDir -ItemType Directory | Out-Null
}

$manifest = Get-Content $ManifestPath -Raw | ConvertFrom-Json
$version = $manifest.version
if (-not $version) {
    throw "Manifest version is required"
}

$staging = Join-Path $OutputDir "staging"
if (Test-Path $staging) {
    Remove-Item -Path $staging -Recurse -Force
}
New-Item -Path $staging -ItemType Directory | Out-Null

$pathsToInclude = @(
    "README.md",
    "SUPPORT.md",
    "SECURITY.md",
    "docs",
    "examples",
    "downloads",
    "preview-manifest.json"
)

foreach ($path in $pathsToInclude) {
    if (Test-Path $path) {
        Copy-Item -Path $path -Destination $staging -Recurse -Force
    }
}

$zipName = "cosmosdb-vscode-ai-assistant-$version.zip"
$zipPath = Join-Path $OutputDir $zipName
if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
}

Compress-Archive -Path (Join-Path $staging "*") -DestinationPath $zipPath -CompressionLevel Optimal

$hash = Get-FileHash -Path $zipPath -Algorithm SHA256
$hashFile = Join-Path $OutputDir "$zipName.sha256.txt"
"$($hash.Hash)  $zipName" | Set-Content -Path $hashFile -Encoding ASCII

Write-Host "Preview package created: $zipPath"
Write-Host "Checksum file created: $hashFile"
