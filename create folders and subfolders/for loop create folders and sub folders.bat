@echo off
:: Set baseDir to the directory where the script is located
set "baseDir=%~dp0"

:: Create the main folders
for %%d in (a b) do (
    mkdir "%baseDir%%%d"
    
    :: Check the folder name and add specific subfolder
    if "%%d"=="a" (
        mkdir "%baseDir%%%d\w"
    ) 
    
    :: Add common subfolders
    for %%f in ("unlock" "main" "go" "test 1" "test (3)") do (
        mkdir "%baseDir%%%d\%%~f"
    )
    
    :: Add numbered subfolders
    for %%s in (1 2 3) do (
        mkdir "%baseDir%%%d\%%s"
    )
)

:: Confirm completion
echo Conditional folders have been created in "%baseDir%".
pause
