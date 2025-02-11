@echo off
setlocal EnableDelayedExpansion
set egfilesName="CHANGE 002 2025-01-15 [15-01-2025].pdf","CHANGE 251 2025-01-15 [15-01-2025].pdf"
set "index=CHANGE"
set "actions[CHANGE]=CHANGE USER"

for %%i in (!index!) do (
    echo in for loop !actions[%%~i]!
)

@REM goto :end

for %%a in (%egfilesName%) do (
    call :createFile %%a
    )

goto :end

::using defined to check variable has value or not
set "test="
if defined test (
    echo test is defined
) else (
    echo xxxxx test is not defined
)

:createFile
set "fileName=%~1"
echo !fileName!
if not exist !fileName! (
echo create file !fileName! >!fileName!
)
:end