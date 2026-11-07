$ErrorActionPreference = 'Stop'
$serverRoot = Join-Path $PSScriptRoot 'odyssey-2-server-develop'
$clientRoot = Join-Path $PSScriptRoot 'odyssey-2-client-develop'
$logRoot = Join-Path $PSScriptRoot 'logs'
New-Item -ItemType Directory -Force -Path $logRoot | Out-Null
$node = (Get-Command node.exe -ErrorAction Stop).Source
Push-Location $serverRoot
try { & npm.cmd run build; if ($LASTEXITCODE) { throw 'Server build failed' } } finally { Pop-Location }
Push-Location $clientRoot
try { & npm.cmd run build; if ($LASTEXITCODE) { throw 'Client build failed' } } finally { Pop-Location }
$serverProcess = Start-Process -FilePath $node -ArgumentList 'bin/odyssey.js' -WorkingDirectory $serverRoot -WindowStyle Hidden -PassThru -RedirectStandardOutput (Join-Path $logRoot 'server.log') -RedirectStandardError (Join-Path $logRoot 'server-error.log')
try {
  $ready = $false
  $deadline = [DateTime]::UtcNow.AddSeconds(15)
  while ([DateTime]::UtcNow -lt $deadline) {
    if ($serverProcess.HasExited) {
      $details = Get-Content (Join-Path $logRoot 'server-error.log') -Raw
      throw "Server exited before startup. $details"
    }
    $probe = [System.Net.Sockets.TcpClient]::new()
    try {
      $probe.Connect('127.0.0.1', 5751)
      $ready = $true
    } catch { Start-Sleep -Milliseconds 200 } finally { $probe.Dispose() }
    if ($ready) { break }
  }
  if (!$ready) { throw "Server did not become ready. See $logRoot" }
  # GUI executables invoked with & may return immediately in PowerShell.
  # Keep the server alive for the lifetime of Electron's main process.
  $clientProcess = Start-Process -FilePath (Join-Path $clientRoot 'node_modules\electron\dist\electron.exe') -ArgumentList '.' -WorkingDirectory $clientRoot -PassThru -RedirectStandardOutput (Join-Path $logRoot 'client.log') -RedirectStandardError (Join-Path $logRoot 'client-error.log')
  $clientProcess.WaitForExit()
} finally { if (!$serverProcess.HasExited) { Stop-Process -Id $serverProcess.Id } }
