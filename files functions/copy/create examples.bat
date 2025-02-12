@echo off
setlocal EnableDelayedExpansion

set "currentPath=%~dp0"
set folders= CHANGE MAINTENANCE CLOSE OPEN
echo new file > "new file.txt"
for %%f in (!folders!) do (
    if not exist %%f  (
    mkdir %%f
    echo this is file > %%f\file.txt 2>&1
    )
)

set newFolder=NEW
if not exist !newFolder! (
mkdir !newFolder!
echo new file >>"!newFolder!\new file.txt" 2>&1
)