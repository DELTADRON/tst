@set cmda.temp=%temp%\cmda
@set cmda.home=%programfiles%\cmda
@echo off

if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)


(echo %cmda.home%)>"%cmda.temp%\locate"

if exist "%cmda.home%" (
    del /q destination\*
    del /q destination
)
mkdir "%cmda.home%"

cd "%cmda.temp%"

call :unzip "%app.temp%\install.zip" "%cmda.temp%"
move "%cmda.temp%\cmda\*" "%cmda.home%"
setx /M path "%path%;%cmda.home%"
msg 0 "Installed"

goto 0

:unzip
powershell -nologo -noprofile -command "& { $shell = New-Object -COM Shell.Application; $target = $shell.NameSpace('%2'); $zip = $shell.NameSpace('%1'); $target.CopyHere($zip.Items(), 16); }"
exit /b

:0