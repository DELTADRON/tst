@set cmda.home=%programfiles%\cmda
@echo off

if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)
(echo %cmda.home%)>"%temp%\cmda\locate"

if exist "%cmda.home%" erase /s /q "%cmda.home%"

call :move "%temp%\cmda\cmda" "%programfiles%"
setx /M path "%path:C:\Program Files\cmda=%"
setx /M path "%path%;%programfiles%\cmda"
timeout /t 1>nul
msg 0 "Installed"
erase /s /q "%temp%\cmda\apps\cmda_installer"

goto 0

:move
for %%a in ("%1\*") do move /y "%%~fa" %2
for /d %%a in ("%1\*") do move /y "%%~fa" %2
exit /b

:0