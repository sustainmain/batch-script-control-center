@echo off
title Control Center
cls
echo Welcome to the Control Center!
echo.

:LOOP
set trigger=""
set program=""
set file=""
set /p command="Command: "
if /i "%command%" == "add" (goto ADD)
if /i "%command%" == "calc" (goto CALC)
if /i "%command%" == "cmd" (goto CMD)
if /i "%command%" == "exit" (exit)
if /i "%command%" == "help" (goto HELP)
if /i "%command%" == "note" (goto NOTE)
call commands "%command%"
goto LOOP


:CALC
start calc
goto LOOP

:CMD
start
goto LOOP

:HELP
echo.
echo.
type "command-list.txt"
echo.
echo.
pause
goto LOOP

:NOTE
start notepad
goto LOOP

:ADD
set /p trigger="What should the command trigger be? "
set /p program="What program should be started? (Add quotes if necessary): "
set /p file="What file should be started by this program? (Add quotes if necessary): "
echo %trigger%>>command-list.txt
echo.>>commands.bat
echo :%trigger%>>commands.bat
echo.
echo.
echo What is the correct syntax to start this program?
echo.
echo (1): %program% %file%
echo (2): start %program% %file%
echo (3): start "" %program%
choice /c 123 /n /m ""
if %errorlevel% == 1 (goto SYNTAX1)
if %errorlevel% == 2 (goto SYNTAX2)
if %errorlevel% == 2 (goto SYNTAX3)

:SYNTAX1
if %file% == "" (
	echo %program%>>commands.bat
) else (
	echo %program% %file%>>commands.bat
)
goto FINALCOMMAND

:SYNTAX2
if %file% == "" (
	echo start %program%>>commands.bat
) else (
	echo start %program% %file%>>commands.bat
)
goto FINALCOMMAND

:SYNTAX3
echo start "" %program%>>commands.bat
goto FINALCOMMAND

:FINALCOMMAND
echo goto:eof>>commands.bat
goto LOOP
