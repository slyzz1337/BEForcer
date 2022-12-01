@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:-------------------------------------- 
:variables
set green=[0;32m
set red=[0;31m
set reset=[0m
set bold=[1m
set white=[0m
set blue=[96m
set grey=[38;5;238m
set r=[0m
set -=%blue%-%white%
SET version=1.4
:-------------------------------------- 
cls
title Hello %username%!
echo [%green%+%white%] Authenticated
timeout /t 1 /nobreak >nul
goto password

:password
cls
title Enter Key
echo.
set /p password=%green% Key: %r%
if %password%=="" goto:password
if %password%==slyzz (goto menu2) else (goto password2)
:: ------------------------------------------------------------------------------------------------------------------------------
:password2
cls
color C
echo Invalid Key
ping localhost -n 2 > nul
goto password
cls
:: ------------------------------------------------------------------------------------------------------------------------------
:menu2
cls
color A
title Badware Forcer l discord.gg/slyzz
echo.
echo [1] BattleEye
echo [2] EasyAntiCheat (Need Update / Don't Work)
echo.
set choiceinput=
choice /c:12 /n /m "%DEL%    >   "
set choice=%errorlevel%
if "%choice%"=="1" goto choice1
if "%choice%"=="2" goto choice2

:choice1
cls
echo.
echo Made by SlyZz
echo.
echo Press ENTER when you are in Fortnite Loading Screen...
echo.
echo %red%[+] If its not the good patch, run fortnite manually%r%
start /d "C:\Program Files (x86)\Epic Games\Launcher\Portal\Binaries\Win32" EpicGamesLauncher.exe 
start /d "C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe"

pause>nul

taskkill /f /IM FortniteClient-Win64-Shipping_EAC.exe
taskkill /f /IM EasyAntiCheat.exe
start "" "C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping_BE.exe"
cls
color 6
timeout /t 3 /nobreak >nul
echo ------------------------------------------------------------------------------------------------------------------
echo Starting BE!
pause>nul
timeout /t 5 /nobreak >nul
goto menu2

:choice2
goto menu2


