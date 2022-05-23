@echo off
title Task Manager
set task=""

:LOOP
cls
tasklist
echo.
echo.
echo Choose an option:
echo ================
echo.
echo 1) Start task
echo 2) Stop task
echo 3) Exit
echo.
choice /c 123 /n /m ""
if errorlevel == 3 (goto END)
if errorlevel == 2 (goto STOP)
if errorlevel == 1 (goto START)
goto LOOP

:START
set /p task="What task? "
start %task%
goto LOOP

:STOP
set /p task="What task? "
taskkill /im %task% /f
goto LOOP

:END
exit