@echo off

setlocal EnableDelayedExpansion
:: Define the base path (current script directory)
set "basePath=%~dp0"

xcopy "NEW" "CHANGE\" /S /I /F /Y >>copy_log.txt 2>&1
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

xcopy "NEW" "C:\test\" /S /I /F /-Y
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