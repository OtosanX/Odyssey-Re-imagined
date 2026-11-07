@echo off
cd /d "%~dp0odyssey-2-client-develop"
start "Odyssey Studio" "node_modules\electron\dist\electron.exe" . --editor
