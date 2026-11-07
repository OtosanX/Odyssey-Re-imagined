param([string]$OutputDirectory = (Split-Path $PSScriptRoot -Parent))
$ErrorActionPreference = 'Stop'
$compiler = Join-Path $env:WINDIR 'Microsoft.NET/Framework64/v4.0.30319/csc.exe'
New-Item -ItemType Directory -Path $OutputDirectory -Force | Out-Null
foreach ($entry in @(@('Odyssey.exe','GAME'), @('Odyssey Server.exe','SERVER'), @('Odyssey Studio.exe','EDITOR'))) {
  $target = Join-Path $OutputDirectory $entry[0]
  & $compiler /nologo /target:winexe /reference:System.Windows.Forms.dll "/define:$($entry[1])" "/out:$target" (Join-Path $PSScriptRoot 'PortableLauncher.cs')
  if ($LASTEXITCODE -ne 0) { throw "Failed to build $target" }
}
