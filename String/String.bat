@echo off
@REM Reduce Strings /remove characters from start and end by 3
set "String1=123this is a string123"
echo %String1%
echo %String1:~3,-3%

for %%f in (*) do ( 
    echo %%f
    set "name=%%~nxf"
    setlocal EnableDelayedExpansion
    echo !name!
    endlocal
   )

@REM Replace String with empty or remove the word
set "replace=%String1:string= %"
echo replace result:  %replace%

@REM Replace String 
set "replacew=%String1:string=replace%"
echo replace result:  %replacew%

pause