@echo off

setlocal EnableDelayedExpansion
set "n=new file.txt"
call :looping "!n!" new
echo ===new name here==== !new!

pause 
exit /b

goto :end
:looping 
set "name=%~1"
set "extractEXTName=%~n1"
set "extension=%~x1"
set "existFileIndex=!extractEXTName:~-5!"

if "!existFileIndex!"=="_new_1" (
call :addFileIndex "!name!" new4
set "newName=!new4!"
) else (
set "existFileN=!extractEXTName:~0,-1!"
set "existF=!existFileN:~-5!"
if "!existF!"=="_new_" (
set "newName=!extractEXTName!.txt"
)else (
set "newName=!extractEXTName!_new_1.txt"
)
)
:: echo ********newName*******==!newName!
if exist "!newName!" (
call :addFileIndex "!newName!" new3
set "newName=!new3!"
:: recheck new file name is exist or not
call :looping "!new3!" new2
set "%~2=!new2!"
) else (
set "%~2=!newName!"
)

exit /b

:addFileIndex
set "existName=%~1"
set "len=0"
set "extractEXTnewName=!existName:~0,-4!"

::extract the number of file in name of last char
set "fileIndex=!extractEXTnewName:~-1!"
set /a newFileIndex=fileIndex+1
set "newName2=!extractEXTnewName:~0,-1!%newFileIndex%.txt"
set "%~2=!newName2!"
exit /b

:end

