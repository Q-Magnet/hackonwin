@echo off
if "%1"=="-v" (goto version)


chcp 65001
color
set username=root
set computername=localhost
for /f "delims=#" %%i in ('prompt #$E#^&echo on^&for %%a in ^(1^) do rem') do set ESC=%%i
set PATH=%PATH%;%CD%
call clrtol.bat -f "255" "0" "0" "┌─" "HEAD"
call clrtol.bat "255" "255" "255" "255" "0" "0" "%USERNAME%@%COMPUTERNAME%$S" "PA"
call clrtol.bat "255" "0" "0" "0" "128" "255" "" "SPLA"
call clrtol.bat "255" "255" "255" "0" "128" "255" "$S$P" "PB"
call clrtol.bat -f "0" "128" "255" "" "SPLB"
call clrtol.bat -f "255" "0" "0" "└─$$$S" "PC"

prompt %HEAD%%PA%%SPLA%%PB%%SPLB%$_%PC%
goto EOF


:version
echo oh-my-cmd %oh-my-cmd-ver% running on %POWERSHELL_DISTRIBUTION_CHANNEL:~4%

:EOF