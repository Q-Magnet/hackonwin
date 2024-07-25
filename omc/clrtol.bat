@echo off
rem set %~6=
if %1==-f (goto fore)
if %1==-b (goto back)
set %~8=%ESC%[38;2;%~1;%~2;%~3m%ESC%[48;2;%~4;%~5;%~6m%~7%ESC%[m
goto eof
:fore
set %~6=%ESC%[38;2;%~2;%~3;%~4m%~5%ESC%[m
goto eof
:back
set %~6=%ESC%[48;2;%~2;%~3;%~4m%~5%ESC%[m
goto eof
:EOF