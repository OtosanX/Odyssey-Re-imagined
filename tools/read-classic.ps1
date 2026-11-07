$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
$c=New-Object -ComObject ADODB.Connection
$c.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=$root\archive\codemallet_classic_sandbox_edition_v2_bin\sandbox\ClassicServer\server.dat;Jet OLEDB:Database Password=ontario;Mode=Read;")
try {
 foreach($table in @('Maps','Objects','Data')){
 $r=$c.Execute("SELECT TOP 1 * FROM [$table]")
 $names=@();foreach($f in $r.Fields){$names+=$f.Name};Write-Output ($table+': '+($names -join ', '));$r.Close()
 }
} finally {$c.Close()}
