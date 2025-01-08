@echo off
:: Base directory where folders will be created
set "baseDir=%~dp0"

:: Create the folder structure
mkdir "%baseDir%\a"
mkdir "%baseDir%\b"
mkdir "%baseDir%\a\1"
mkdir "%baseDir%\a\2"
mkdir "%baseDir%\a\3"
mkdir "%baseDir%\b\1"
mkdir "%baseDir%\b\2"
mkdir "%baseDir%\b\3"

:: Confirm completion
echo Folders and subfolders have been created under %baseDir%.
pause