@echo off

setlocal EnableDelayedExpansion

set "currentPath=%~dp0"
dir "%currentPath%" /AD /B
for /D %%f in ("!currentPath!\*") do (
echo %%f>>list.txt
)

@REM goto :end
set folders= CHANGE MAINTENANCE CLOSE OPEN
@REM mkdir %folders%

::Create Multiple files
@REM for %%f in (!folders!) do (
@REM     mkdir %%f
@REM     echo this is file > %%f\file.txt
@REM )

:: copy folders and file
set "currentPath=%~dp0"
set "targetPath=\\10.0.0.201\public\FORM UPDATE FLEXCUBE\Scan\TEST"
set "log=copy_log.txt"


:: Check if the target path exists
if exist "%targetPath%" (
    echo target existed
    echo ------START------- %date% %time% -------START------ >>%log%
:: Loop through directories in the current path
for /d %%f in (*) do (
    @REM echo f--- %%f
    xcopy "%%f" "%targetPath%\%%f" /E /I /Y >>"!log!" 2>&1
    :: Check the exit code of xcopy
if %errorlevel% equ 0 (
    echo Files copied successfully.
) else if %errorlevel% equ 1 (
    echo Files copied, but extra files exist in the destination.
) else if %errorlevel% equ 2 (
    echo Some files were not found or could not be copied.
) else if %errorlevel% equ 4 (
    echo Initialization error occurred.
) else (
    echo An unknown error occurred.
)
)
set "completeJob=====----END---- copy to ^"!targetPath!^" is complete ----END----======"
echo  !completeJob!>>"!log!"
echo  !completeJob!
pause

exit /b 0
) else (
    echo target path not existed
    pause
    exit /b 1
)

:end