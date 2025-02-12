@echo off
setlocal EnableDelayedExpansion

set "destinationPath=C:\test\"
copy "copy_log.txt" "CHANGE USER\copy_log.txt"

set "basePath=%~dp0"
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

goto :end

::function to copy files to destination path
:listFile
set "dir=%~1"
    for %%f in ("!dir!\*") do (
        @REM echo base path=== !basePath!%%f
        @REM echo ==dir--!dir! ---file-- %%f
        set "sourceFile=!basePath!%%f"
        set "destinationFile=!destinationPath!%%f"
        set "pNewName=!destinationFile:~0,-4!"
        set "newName=!pNewName!_new.pdf"
        if exist "!sourceFile!" (
            if exist "!destinationFile!" (
                echo new name---:--"!newName!"
                echo ---------- destinationFile is exist --------------------
                xcopy "!basePath!%%f" "!newName!"*
            ) else (
echo -----file exist---
        xcopy "!basePath!%%f" "!destinationPath!%%f"*
            )
        )
    )
@REM set "dir=CHANGE USER"
@REM echo !dir!
@REM for /r "%dir%" %%f in (*) do (
@REM     set "file=%%f"
@REM     echo !file!
@REM     )

:end