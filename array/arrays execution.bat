@echo off
setlocal enabledelayedexpansion

REM Define array elements
set "items[001]=apple"
set "items[111]=banana"
set "items[251]=cherry"

REM Set index variable
set index=001

REM Access the array element dynamically
for %%a in (!index!) do (
    echo The item at index %%a is: !items[%%a]!
)

pause