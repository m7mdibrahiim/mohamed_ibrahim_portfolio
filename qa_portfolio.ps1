[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

function Invoke-Checked {
    param(
        [Parameter(Mandatory = $true)][string]$Stage,
        [Parameter(Mandatory = $true)][string]$Command,
        [Parameter()][string[]]$Arguments = @()
    )

    Write-Host "`n=== $Stage ===" -ForegroundColor Cyan
    & $Command @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "$Stage failed with exit code $LASTEXITCODE."
    }
}

$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $projectRoot

try {
    Invoke-Checked -Stage 'Flutter version' -Command 'flutter' -Arguments @('--version')
    Invoke-Checked -Stage 'Flutter clean' -Command 'flutter' -Arguments @('clean')
    Invoke-Checked -Stage 'Resolve dependencies' -Command 'flutter' -Arguments @('pub', 'get')
    Invoke-Checked -Stage 'Dart format check' -Command 'dart' -Arguments @('format', '--output=none', '--set-exit-if-changed', '.')
    Invoke-Checked -Stage 'Flutter analyze' -Command 'flutter' -Arguments @('analyze')
    Invoke-Checked -Stage 'Flutter tests' -Command 'flutter' -Arguments @('test')
    Invoke-Checked -Stage 'Flutter Chrome tests' -Command 'flutter' -Arguments @('test', '--platform', 'chrome')
    Invoke-Checked -Stage 'Flutter Web release build' -Command 'flutter' -Arguments @('build', 'web', '--release')

    $buildPath = Join-Path $projectRoot 'build\web'
    Write-Host "`nSUCCESS: production build created at $buildPath" -ForegroundColor Green
}
catch {
    Write-Error $_
    exit 1
}
