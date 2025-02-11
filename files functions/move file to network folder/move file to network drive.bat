@echo off

setlocal EnableDelayedExpansion

set "currentPath=%~dp0"
dir "%currentPath%" /AD /B
for /D %%f in ("!currentPath!\*") do (
echo %%f>>list.txt
)

goto :end
set folders= CHANGE MAINTENANCE CLOSE OPEN
@REM mkdir %folders%

::Create Multiple files
@REM for %%f in (!folders!) do (
@REM     mkdir %%f
@REM     echo this is file > %%f\file.txt
@REM )

:: move folders and file
set "currentPath=%~dp0"
set "targetPath=\\10.0.0.201\public\FORM UPDATE FLEXCUBE\Scan\TEST"
set "log=copy_log.txt"

@REM echo ----- %date% %time% ----->%log%
:: Check if the target path exists
if exist "%targetPath%" (
    echo target existed
    echo ------START------- %date% %time% -------START------ >>%log%
:: Loop through directories in the current path
for /d %%f in (*) do (
    @REM echo f--- %%f
    xcopy "%%f" "%targetPath%\%%f" /E /I /Y >>"!log!"
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