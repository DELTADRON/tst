@set cmda.home=%programfiles%\cmda
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)
(echo %cmda.home%)>"%temp%\cmda\locate"
if exist "%cmda.home%" erase /s /q "%cmda.home%"
for %%a in ("%temp%\cmda\cmda\*") do move /y "%%~fa" "%programfiles%"
for /d %%a in ("%temp%\cmda\cmda\*") do move /y "%%~fa" "%programfiles%"
setx /M path "%path:;C:\Program Files\cmda=%"
setx /M path "%path%;%programfiles%\cmda"
setx /M path "%path%;%programfiles%\cmda\lib"
timeout /t 1>nul
msg 0 "Installed"
erase /s /q "%temp%\cmda\apps\cmda_installer"
if exist "%temp%\cmda\cmda" erase /s /q "%temp%\cmda\cmda"