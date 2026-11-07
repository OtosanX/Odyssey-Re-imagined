$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
$out=Join-Path $root 'archive\classic-export'
New-Item -ItemType Directory -Force -Path $out,(Join-Path $out 'maps') | Out-Null
$c=New-Object -ComObject ADODB.Connection
$c.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=$root\archive\codemallet_classic_sandbox_edition_v2_bin\sandbox\ClassicServer\server.dat;Jet OLEDB:Database Password=ontario;Mode=Read;")
try {
 $r=$c.Execute('SELECT * FROM Maps');$count=0
 while(!$r.EOF){$id=[int]$r.Fields.Item('Number').Value;$v=$r.Fields.Item('Data').Value;if($v -is [string]){$b=[Text.Encoding]::GetEncoding(1252).GetBytes($v)}else{$b=[byte[]]$v};[IO.File]::WriteAllBytes((Join-Path $out "maps\$id.bin"),$b);$count++;$r.MoveNext()};$r.Close();Write-Output "Exported $count map records"
 foreach($table in @('Objects','Data','Classes','Monsters','Scripts','NPCs','Halls','Guilds')){
  try{$r=$c.Execute("SELECT * FROM [$table]")}catch{Write-Output "Skipped $table";continue}
  $records=@();while(!$r.EOF){$row=@{};foreach($f in $r.Fields){if($f.Value -isnot [DBNull]){$row[$f.Name]=$f.Value}};$records+=$row;$r.MoveNext()};$r.Close();if($table -eq 'Data'){[IO.File]::WriteAllBytes((Join-Path $out 'item-spawns.bin'),[Text.Encoding]::GetEncoding(1252).GetBytes([string]$records[0].ObjectData))};$records | ConvertTo-Json -Depth 8 | Set-Content -Encoding UTF8 (Join-Path $out "$table.json");Write-Output "$table : $($records.Count) records"
 }
}finally{$c.Close()}



