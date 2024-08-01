@echo off
@REM to use function
call :ReturnValue test


call :hello
set val1=val1
set "val2=val2"
set val3=%val1%
call :withParameters %val1% %val2% %val3%

@REM the result from ReturnValue Functionr
echo %test%

pause

:hello
echo say Hello Here
exit /B 0

@REM function with parameter
:withParameters
echo parameter1: %~1
echo parameter2: %~2
echo parameter3: %~3
exit /B 0

:ReturnValue
echo initial: %~1
set %~1=%~1 modify here ==== returnValue

exit /B 0