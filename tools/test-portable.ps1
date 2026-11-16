param([string]$ArchivePath)
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
if(!$ArchivePath){$ArchivePath=(Get-Content (Join-Path $root 'dist/latest.json') -Raw|ConvertFrom-Json).archive}
$testRoot=Join-Path ([IO.Path]::GetTempPath()) ('odyssey-package-'+[guid]::NewGuid().ToString('N'))
$extracted=Join-Path $testRoot 'Extracted game with spaces'
Add-Type -AssemblyName System.IO.Compression.FileSystem
[IO.Compression.ZipFile]::ExtractToDirectory($ArchivePath,$extracted)
$manifest=Get-Content (Join-Path $extracted 'release-manifest.json') -Raw|ConvertFrom-Json
foreach($file in $manifest.files){$target=Join-Path $extracted $file.path;if(!(Test-Path -LiteralPath $target)){throw "Missing packaged file: $($file.path)"};if((Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash.ToLower() -ne $file.sha256){throw "Hash mismatch: $($file.path)"}}
foreach($exe in @('Odyssey.exe','Odyssey Server.exe','Odyssey Studio.exe')){$p=Start-Process -FilePath (Join-Path $extracted $exe) -ArgumentList '--check-package' -WindowStyle Hidden -Wait -PassThru;if($p.ExitCode -ne 0){throw "Package check failed: $exe"}}
$incomplete=Join-Path $testRoot 'Source download';New-Item -ItemType Directory -Path $incomplete|Out-Null
Copy-Item -LiteralPath (Join-Path $extracted 'Odyssey.exe') -Destination $incomplete
$p=Start-Process -FilePath (Join-Path $incomplete 'Odyssey.exe') -ArgumentList '--check-package' -WindowStyle Hidden -Wait -PassThru
if($p.ExitCode -ne 2){throw 'Missing runtime was not diagnosed'}
$env:ODYSSEY_PACKAGE_TEST_ROOT=$extracted
$env:ODYSSEY_PROFILE_ROOT=Join-Path $testRoot 'Fresh profile'
$env:ODYSSEY_HEADLESS_TEST='1'
$p=Start-Process -FilePath (Join-Path $extracted 'client/node_modules/electron/dist/electron.exe') -ArgumentList ('"'+(Join-Path $PSScriptRoot 'test-portable-ui.cjs')+'"') -WindowStyle Hidden -Wait -PassThru -RedirectStandardOutput (Join-Path $testRoot 'ui.log') -RedirectStandardError (Join-Path $testRoot 'ui-error.log')
Get-Content (Join-Path $testRoot 'ui.log')
if($p.ExitCode -ne 0){Get-Content (Join-Path $testRoot 'ui-error.log');throw 'Extracted game failed to open its login screen'}
Write-Output "PASS: extracted ZIP hashes, all three EXEs, missing-runtime diagnosis and fresh-profile login screen. Test directory: $testRoot"
