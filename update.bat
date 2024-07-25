@echo off
set path=%path%;.\unzip;.
if %1==aircrack-ng (goto acng)
if %1==burpsuite (goto burpsuite)
if %1==metasploit (goto ms)
goto unspec

:ms
wget https://windows.metasploit.com/metasploitframework-latest.msi
if %ERRORLEVEL%==0(goto ms-a)
goto errorwget
:ms-a
msiexec /package metasploitframework-latest.msi


:burpsuite
	echo Burpsuite currently has NO direct link to download, press any key to visit website or Ctrl+C to exit && pause>nul
	cmd /c start https://portswigger.net/burp/community-download-thank-you
:acng
	rem get version file
	del /q /f index.html.*
	del /q /f index.html
	echo Retrieving aircrack-ng latest version
	wget.exe https://download.aircrack-ng.org/index.html
	if %ERRORLEVEL%==0 (goto acng-a)
	goto errorwget

	:acng-a
	rem get version
	for /f "delims=" %%i in ('type index.html') do set content=%%i
	set acng_ver=%CONTENT:~17%
	:acng-b
	if exist aircrack-ng-%acng_ver%-win.zip (goto acng-c)
	del /q /f aircrack-ng-*-win.zip
	del /q /f aircrack-ng-*-win.zip.*
	wget https://download.aircrack-ng.org/aircrack-ng-%acng_ver%-win.zip
	if %ERRORLEVEL%==0 (goto acng-c)
	goto errorwget
	:acng-c
	rd /s /q .\aircrack-ng
	rd /s /q .\aircrack
	unzip %CD%\aircrack-ng-%acng_ver%-win.zip 'aircrack-ng-%acng_ver%-win/bin/*' -d %CD%\aircrack -qq
	mkdir aircrack-ng
	copy .\aircrack\aircrack-ng-%acng_ver%-win\bin\*.* .\aircrack-ng
	rd /s /q .\aircrack
	echo finish
	goto eof

:unspec
echo Unspecified/Unknown package to update.
goto EOF
:errorwget
set err=%ERRORLEVEL%
wgeterror.bat %ERR%
goto EOF
:EOF