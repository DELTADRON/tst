@set app.id=cmda_installer
@set app.name=CMDA installer
@set app.start=%cd%
@set app.temp=%temp%\cmda\apps\%app.id%

@title %name%
@chcp 65001 >nul
@mode 91,25
@color 07
@echo off

if not exist "%app.temp%" mkdir "%app.temp%"
if not exist "%temp%\cmda\ext" mkdir "%temp%\cmda\ext"
(echo %cd%)>"%app.temp%\locate"

call :get_file "https://deltadron.github.io/tst/cmda/cmda.zip" "%app.temp%\install.zip"
call :get_file "https://deltadron.github.io/tst/cmda/installer.cmd" "%app.temp%\installer.cmd"
timeout /t 1>nul
explorer "%app.temp%\installer.cmd"

goto 0

:get_file
bitsadmin /Transfer DownFile "%1" "%2"
exit /b

:0