@echo off
setlocal EnableDelayedExpansion

REM example string
set str=Hello, World! example for splitting string by space
REM Display the string
echo !str!

REM split the string
for /f "tokens=1,2,3,4,5,6,7,8,9,10 delims= " %%a in ("!str!") do (
    set token1=%%a
    set token2=%%b
    set token3=%%c
    set token4=%%d
    set token5=%%e
    set token6=%%f
    set token7=%%g
    set token8=%%h
    set token9=%%i
    set token10=%%j
)
REM Display the tokens
echo Token 1: !token1!
echo Token 2: !token2!
echo Token 3: !token3!
echo Token 4: !token4!
echo Token 5: !token5!
echo Token 6: !token6!
echo Token 7: !token7!
echo Token 8: !token8!