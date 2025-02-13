@echo off
setlocal EnableDelayedExpansion

set "destinationPath=C:\test\"
set "fileType=.pdf"
:::copy "copy_log.txt" "CHANGE USER\copy_log.txt"

set "basePath=%~dp0"
echo **************************************************************************************>>copy_log.txt
echo **************************************************************************************>>copy_log.txt
echo ***********************^>^>^>^>^>^>BELOW^<^<^<^<^<^<^<^<********************************************>>copy_log.txt

echo ---------------Start-%date% %time%----copy----------------START--------->>copy_log.txt
for /d %%a in (*) do (
    @REM echo action==="%%a"
    if "%%a" NEQ "NEW" (
    for /d %%b in ("%%a\*") do (
        @REM echo branch---%%b
        call :listFile "%%b"
        for /d %%u in ("%%b\*") do (
            @REM echo unit---%%u
            call :listFile "%%u"
        )
    )
    )
    @REM call :listFile "%%d" 
)

echo ---------------END---%date% %time%--  copy----------------END--------->>copy_log.txt
exit /b

goto :end

::function to copy files to destination path
:listFile
set "dir=%~1"
    for %%f in ("!dir!\*") do (
        @REM echo base path=== !basePath!%%f
        @REM echo ==dir--!dir! ---file-- %%f
        set "sourceFile=!basePath!%%f"
        set "destinationFile=!destinationPath!%%f"
::---------------Start Copy files-----------------------------
        if exist "!sourceFile!" (
            if exist "!destinationFile!" (
                call :renameFile "!destinationFile!" newName
                echo new name---:--"!newName!"
                @REM echo ---------- destinationFile is exist --------------------
                xcopy "!basePath!%%f" "!newName!"*>>copy_log.txt
            ) else (
@REM echo -----file exist---
        xcopy "!basePath!%%f" "!destinationFile!"*>>copy_log.txt
            )
        )
    )
    exit /b


goto :end

:renameFile 
set "name=%~1"
set "extractEXTName=!name:~0,-4!"
set "existFileIndex=!extractEXTName:~-5!"

if "!existFileIndex!"=="_new_1" (
call :addFileIndex "!name!" new4
set "newName=!new4!"
) else (
set "existFileN=!extractEXTName:~0,-1!"
set "existF=!existFileN:~-5!"
if "!existF!"=="_new_" (
set "newName=!extractEXTName!%fileType%"
)else (
set "newName=!extractEXTName!_new_1%fileType%"
)
)
:: echo ********newName*******==!newName!
if exist "!newName!" (
call :addFileIndex "!newName!" new3
set "newName=!new3!"
:: recheck new file name is exist or not
call :renameFile "!new3!" new2
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
set "newName2=!extractEXTnewName:~0,-1!%newFileIndex%.pdf"
set "%~2=!newName2!"
exit /b


:end