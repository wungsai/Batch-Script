@echo off
echo ===Rename=====

for %%f in (*.*) do (
set "name=%%~nxf"
set "ext=%%~xf"
setlocal EnableDelayedExpansion
::echo !name!
if !ext!==.txt ( echo skip
) else (set "new=!name:~0,-4!
echo !new!
)
endlocal
)

pause