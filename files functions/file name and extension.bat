@echo off
echo ***Work with File Name ******
for %%f in (*.*) do (
    rem full path and file name
    echo %%f

    rem  File name only 
    rem Declare constant Variable
    set "name=%%~nf"

    @REM extension of file
    set "ext=%%~xf"

    @REM file name and extension
    set "nameWithType=%%~nxf"

    @REM when print variable of file must use this setlocal 
 setlocal EnableDelayedExpansion
    echo filename : !name!
    echo extension file : !ext!
    echo name with type of file: !nameWithType!
 endlocal
)

@REM list files and files in sub folders
for /R %%f in (*.*) do (
    setlocal EnableDelayedExpansion 
    echo %%f
    endlocal
)

pause