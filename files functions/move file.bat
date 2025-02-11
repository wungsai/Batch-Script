@echo off

setlocal EnableDelayedExpansion
set basePath=%~dp0
echo -----------------------
for %%f in (*.txt*) do (
    set "filename=%%~f"
echo !filename!
)
set "file=a.txt"
set "moveDir=ss"
if exist %file% (
MOVE a.txt "!basePath!\!moveDir!\!file!" ) else (
echo file is not existed
REM ==create new file here----
echo new file here >!file!
)
