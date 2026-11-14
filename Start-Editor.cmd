@echo off
cd /d "%~dp0client"
start "Odyssey Studio" "node_modules\electron\dist\electron.exe" . --editor
