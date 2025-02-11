@echo off
echo --------------------test------------------
set "string=Hello, 001 scripting is fun!"
set "search=001"

REM Use findstr to search for the word in the string
echo %string% | findstr /i "%search%" >nul
if %errorlevel% equ 0 (
    echo Found the word "%search%" in the string.
) else (
    echo Word "%search%" not found in the string.
)


echo ----Using for /f to Find a Word in a String-----
set "string=Hello, Batch scripting is fun!"
set "search=Batch"
set found=false

for %%a in (%string%) do (
    if /i "%%a"=="%search%" (
        set found=true
        goto :found
    )
)

:found
if %found%==true (
    echo Found the word "%search%" in the string.
) else (
    echo Word "%search%" not found in the string.
)

echo =------Using String Manipulation------------
set "string=Hello, Batch!"
set "search=C"

REM Use string manipulation to check for character
echo %string% | findstr /i "%search%" >nul
if %errorlevel% equ 0 (
    echo Found the character "%search%" in the string.
) else (
    echo Character "%search%" not found in the string.
)