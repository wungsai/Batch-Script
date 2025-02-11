@echo off
setlocal EnableDelayedExpansion
REM set example string
set conditionStringA=testa
set conditionStringB=testa
set conditionStringC=testc

REM display examples
 echo test
echo !conditionStringA!
echo !conditionStringB!
echo !conditionStringC!
ECHO ----------------STRING COMPARE----------
REM compare string examples
REM if else example
REM ---NOTE--- USING single quote ' is not work with string contains delimiter like [, = ;] space, comma,
if 'ab' == 'acb' (
    ECHO IT'S TRUE
) ELSE (
    ECHO IT'S FALSE
)
REM only if true
if 'test' == 'test' echo it's true ok

REM using double quote " 
if "a b" == "a b" (
    ECHO IT'S TRUE USING DOUBLE QUOTE
) ELSE (
    ECHO IT'S FALSE USING DOUBLE QUOTE
)

REM insensitive string compare example
if /I "tests" == "TEST" (
    ECHO IT'S TRUE USING /i (insensitive) 
    ) ELSE (
        ECHO IT'S FALSE USING /i (insensitive)
    )

REM using variable example
if "!conditionStringA!" == "testa" (
    ECHO IT'S TRUE USING VARIABLE) else (
        ECHO IT'S FALSE USING VARIABLE
        )

if "!conditionStringA!" == "!conditionStringB!" (
    ECHO IT'S TRUE USING VARIABLES
) else (
    ECHO IT'S FALSE USING VARIABLES
)
ECHO ------------START NUMBER COMPARE BELOW------------------------
REM ------------NUMBER COMPARE---------
SET num1=30
SET num2=20

REM greater than example
if !num1! GTR !num2! (
    ECHO num1 is greater than num2
)
REM GREATER THAN OR EQUAL TO example
if 20 GEQ 10 (
    ECHO FIRST is greater than OR EQUAL SECOND
)

REM number equal
if 10 EQU 10 (
    ECHO first is equal to second
    )
REM number not equal
if 10 NEQ 20 (
    ECHO first is not equal to second
)

rem less than example
if !num2! LSS !num1! (
    ECHO num2 is less than num1
)
rem less than or equal example
if !num2! LEQ !num1! (
    ECHO num2 is less than or equal to num1
)

ECHO ------------CHECK VALUE IS EMPTY--------
REM check value is empty
if "!value!" == "" (
    ECHO value is empty)

IF [!V!] == [] ECHO VALUE IS EMPTY []+

::using defined to check variable has value or not
REM CHECK VALUE IS NULL
IF NOT DEFINED V (
     ECHO VALUE IS NULL
     )

if defined test (
    echo test is defined
) else (
    echo xxxxx test is not defined
)



REM CHECK EXIST FILE
IF EXIST "compare operator.bat" (
    ECHO FILE EXISTS
)
