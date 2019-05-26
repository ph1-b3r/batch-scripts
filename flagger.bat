@echo off
setlocal EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)

rem Prepare a file "X" with only one dot
<nul > X set /p ".=."

set   "star1=X   X   X   X   X   X"
set   "star2=  X   X   X   X   X  "
set "stripe1=                     "
set "stripe2=                                          "

call :Color 9F "%star1%" & call :Color C0 "%stripe1%" & echo(
call :Color 9F "%star2%" & call :Color F0 "%stripe1%" & echo(
call :Color 9F "%star1%" & call :Color C0 "%stripe1%" & echo(
call :Color 9F "%star2%" & call :Color F0 "%stripe1%" & echo(
call :Color 9F "%star1%" & call :Color C0 "%stripe1%" & echo(
call :Color 9F "%star2%" & call :Color F0 "%stripe1%" & echo(
call :Color 9F "%star1%" & call :Color C0 "%stripe1%" & echo(
call :Color 9F "%star2%" & call :Color F0 "%stripe1%" & echo(
call :Color 9F "%star1%" & call :Color C0 "%stripe1%" & echo(
call :Color F0 "%stripe2%" & echo(
call :Color C0 "%stripe2%" & echo(
call :Color F0 "%stripe2%" & echo(
call :Color C0 "%stripe2%" & echo(


:Color
set "param=^%~2" !
set "param=!param:"=\"!"
findstr /p /A:%1 "." "!param!\..\X" nul
<nul set /p ".=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%"
exit /b
cmd /k