if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)
(echo %programfiles%\cmda)>"%temp%\cmda\locate"
if exist "%programfiles%\cmda" erase /s /q "%programfiles%\cmda"
mkdir "%programfiles%\cmda"
for %%a in ("%temp%\cmda\cmda\*") do move /y "%%~fa" "%programfiles%\cmda"
for /d %%a in ("%temp%\cmda\cmda\*") do move /y "%%~fa" "%programfiles%\cmda"
setx /M path "%path:;C:\Program Files\cmda=%"
setx /M path "%path%;%programfiles%\cmda"
setx /M path "%path%;%programfiles%\cmda\lib"
timeout /t 1>nul
msg 0 "Installed"
erase /s /q "%temp%\cmda\apps\cmda_installer"
erase /s /q "%temp%\cmda\cmda"
del /Q "%temp%\cmda\apps\cmda_installer"
del /Q "%temp%\cmda\cmda"