@echo off
cls
goto %~1

:desmos
start "" "https://www.desmos.com/calculator"
goto:eof

:taskman
start /max "cmd" "programs\task-manager.bat"
goto:eof

:drive
start "" "https://drive.google.com/drive/my-drive"
goto:eof

:docs
start "" "https://docs.google.com/document/u/0/"
goto:eof

:mail
start "" "https://mail.google.com/mail/u/0/#inbox"
goto:eof

:class
start "" "https://classroom.google.com/h"
goto:eof

:goog
start "" "https://www.google.com/?gws_rd=ssl"
goto:eof
