@echo off


set "params=%*"cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

REM MAIN MENUE START

:MAIN
cls
color 03
echo.
echo.
echo  +---------------------------------------------+
echo  ^|                                             ^|
echo  ^|       Win 10/11 System Clean ^& Repair       ^|
echo  ^|                                             ^|
echo  ^|            (c) by MacAniak 2024             ^|
echo  ^|                                             ^|
echo  +---------------------------------------------+
echo.
echo.
echo  +---------------------------------------------+
echo  ^|                                             ^|
echo  ^|         Clean Disk           -  c           ^|
echo  ^|                                             ^|
echo  ^|         Clean Temp/Cookies   -  t           ^|
echo  ^|                                             ^|
echo  ^|         Scan/Fix use SFC     -  s           ^|
echo  ^|                                             ^|
echo  ^|         Scan/Fix use DISM    -  d           ^|
echo  ^|                                             ^|
echo  ^|         Restart              -  r           ^|
echo  ^|                                             ^|
echo  ^|         Run SFC/DISM/Restart -  !           ^|
echo  ^|                                             ^|
echo  ^|         Exit                 -  x           ^|
echo  ^|                                             ^|
echo  +---------------------------------------------+
echo.
echo.

set input=
set /p input=  select and hit Enter %username% :

if /i "%INPUT%"=="c" GOTO DCLEAN
if /i "%INPUT%"=="t" GOTO TCLEAN
if /i "%INPUT%"=="s" GOTO SFC
if /i "%INPUT%"=="d" GOTO DISM
if /i "%INPUT%"=="r" GOTO RESTART
if /i "%INPUT%"=="!" GOTO RUN
if /i "%INPUT%"=="x" GOTO EXIT

echo.
echo.
echo ... invalid option ! Press any key to try again ...
pause > NUL
GOTO MAIN

REM MAIN MENUE END

REM CLEAN DISK START

:DCLEAN

color 04
cls
echo.
echo.
echo  +---------------------------------------------+
echo  ^|                                             ^|
echo  ^|                Disk cleanup                 ^|
echo  ^|                                             ^|
echo  ^|         press any key to countinue          ^|
echo  ^|          Mainmenue - m   Exit - x           ^|
echo  ^|                                             ^|
echo  +---------------------------------------------+
echo.
echo.
set input=
set /p input= select m/x or leave blank to continue and hit Enter :

if /i "%INPUT%"=="m" GOTO MAIN
if /i "%INPUT%"=="x" GOTO EXIT

c:\windows\system32\cleanmgr.exe /dc /sagerum: 1

echo.
echo.
echo  +---------------------------------------------+
echo  ^|                                             ^|
echo  ^|                Disk cleaned                 ^|
echo  ^|                                             ^|
echo  ^|         press any key to countinue          ^|
echo  ^|                                             ^|
echo  +---------------------------------------------+
pause > NUL
GOTO MAIN


REM CLEAN DISK END

REM CLEAN TEMP START

:TCLEAN

color 0D
cls
echo.
echo.
echo  +---------------------------------------------+
echo  ^|                                             ^|
echo  ^|         Temp Files/Cookies cleanup          ^|
echo  ^|                                             ^|
echo  ^|         press any key to countinue          ^|
echo  ^|          Mainmenue - m   Exit - x           ^|
echo  ^|                                             ^|
echo  +---------------------------------------------+
echo.
echo.
set input=
set /p input= select m/x or leave blank to continue and hit Enter :

if /i "%INPUT%"=="m" GOTO MAIN
if /i "%INPUT%"=="x" GOTO EXIT

del /a /s /q %windir%\temp & md %windir%\temp>nul
del /a /s /q %userprofile%\recent\*.*>nul
del /a /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*">nul
del /a /s /q "%userprofile%\Local Settings\Temp\*.*">nul
del /a /s /q "%userprofile%\recent\*.*">nul
del /a /s /q %systemdrive%\*.tmp>nul
del /a /s /q %systemdrive%\*._mp>nul
del /a /s /q %systemdrive%\*.log>nul
del /a /s /q %systemdrive%\*.gid>nul
del /a /s /q %systemdrive%\*.chk>nul
del /a /s /q %systemdrive%\*.old>nul
del /a /s /q %systemdrive%\recycled\*.*>nul
del /a /s /q %windir%\*.bak>nul
del /a /s /q %windir%\prefetch\*.*>nul

echo.
echo.
echo  +---------------------------------------------+
echo  ^|                                             ^|
echo  ^|         Temp Files/Cookies cleaned          ^|
echo  ^|                                             ^|
echo  ^|         press any key to countinue          ^|
echo  ^|                                             ^|
echo  +---------------------------------------------+
pause > NUL
GOTO MAIN

REM CLEAN TEMP END

REM EXIT START

:EXIT
cls
echo.
echo.
echo               wishu u a good day %username%
echo.
echo               press any key to exit ...
pause > NUL
exit

REM EXIT END




REM SFC script start

:SFC
cls
color 09
echo.
echo.
echo  +---------------------------------------------+
echo  ^|                                             ^|
echo  ^|            Start scan with sfc              ^|
echo  ^|                                             ^|
echo  ^|         press any key to countinue          ^|
echo  ^|          Mainmenue - m   Exit - x           ^|
echo  ^|                                             ^|
echo  +---------------------------------------------+
echo.
echo.
set input=
set /p input= select m/x or leave blank to continue and hit Enter :

if /i "%INPUT%"=="m" GOTO MAIN
if /i "%INPUT%"=="x" GOTO EXIT

sfc /scannow

echo.
echo.
echo  +---------------------------------------------+
echo  ^|                                             ^|
echo  ^|           Finished scan with sfc            ^|
echo  ^|                                             ^|
echo  ^|         press any key to countinue          ^|
echo  ^|                                             ^|
echo  +---------------------------------------------+
pause > NUL
GOTO MAIN

REM SFC script end

REM DSIM script start

:DISM
cls
color 09
echo.
echo.
echo  +---------------------------------------------+
echo  ^|                                             ^|
echo  ^|            Start scan with DSIM             ^|
echo  ^|                                             ^|
echo  ^|         press any key to countinue          ^|
echo  ^|          Mainmenue - m   Exit - x           ^|
echo  ^|                                             ^|
echo  +---------------------------------------------+
echo.
echo.
set input=
set /p input= select m/x or leave blank to continue and hit Enter :

if /i "%INPUT%"=="m" GOTO MAIN
if /i "%INPUT%"=="x" GOTO EXIT

Dism /Online /Cleanup-Image /CheckHealth
timeout /t 2 > NUL
Dism /Online /Cleanup-Image /ScanHealth
timeout /t 2 > NUL
Dism /Online /Cleanup-Image /RestoreHealth

echo.
echo.
echo  +---------------------------------------------+
echo  ^|                                             ^|
echo  ^|           Finished scan with DISM           ^|
echo  ^|                                             ^|
echo  ^|         press any key to countinue          ^|
echo  ^|                                             ^|
echo  +---------------------------------------------+
pause > NUL
GOTO MAIN

REM DSIM script end

REM Restatrt script start

:RESTART
cls
color 06
echo.
echo.
echo  +---------------------------------------------+
echo  ^|                                             ^|
echo  ^|               Restart System                ^|
echo  ^|           with disabled faststart           ^|
echo  ^|                                             ^|
echo  ^|         press any key to countinue          ^|
echo  ^|          Mainmenue - m   Exit - x           ^|
echo  ^|                                             ^|
echo  +---------------------------------------------+
echo.
echo.
set input=
set /p input= select m/x or leave blank to continue and hit Enter :

if /i "%INPUT%"=="m" GOTO MAIN
if /i "%INPUT%"=="x" GOTO EXIT

shutdown /t 0 /r /f 
echo.
echo.
echo something went wrong ....
echo press any key to go to Mainmenue...
pause > NULL
GOTO MAIN
REM Restatrt script end


REM sfc dsim restart script start

:RUN
cls
color 0C
echo.
echo.
echo  +---------------------------------------------+
echo  ^|                                             ^|
echo  ^|          run sfc / DSIM / Restart           ^|
echo  ^|                                             ^|
echo  ^|        enter: MAKEITSO to countinue         ^|
echo  ^|          Mainmenue - m   Exit - x           ^|
echo  ^|                                             ^|
echo  +---------------------------------------------+
echo.
echo.
set input=
set /p input= select m/x or MAKEITSO and hit Enter :

if /i "%INPUT%"=="m" GOTO MAIN
if /i "%INPUT%"=="x" GOTO EXIT
if /i "%INPUT%"=="MAKEITSO" GOTO MAKEITSO
echo.
echo.
echo        wrong input press any key to try again ...
pause > NULL
GOTO RUN

:MAKEITSO

sfc /scannow
timeout /t 2 > NUL
Dism /Online /Cleanup-Image /CheckHealth
timeout /t 2 > NUL
Dism /Online /Cleanup-Image /ScanHealth
timeout /t 2 > NUL
Dism /Online /Cleanup-Image /RestoreHealth
timeout /t 2 > NUL
shutdown /t 0 /r /f 

echo.
echo.
echo something went wrong ....
echo press any key to go to Mainmenue...
pause > NULL
GOTO MAIN


REM sfc dsim restart script end


