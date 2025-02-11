@echo off
setlocal EnableDelayedExpansion
REM Declare an "array" by assigning indexed variables
set item[0]=Apple
set item[1]=Banana
set item[2]=Cherry
set item[3]=Date

REM Get the number of elements manually
set count=4
set /a ss= count-1
echo %ss%
REM Loop through the "array" elements
for /L %%i in (0,1,%count%) do (
    echo Element %%i: !item[%%i]!
)

echo --------------loop to create array---------------------------
REM Create an array using a for loop
set counter=0

for %%i in (Apple Banana Cherry Date) do (
    set "item[!counter!]=%%i"
    set /a counter+=1
)

REM Print the array
echo Array Length: %counter%

for /L %%j in (0,1,%counter%) do (
    echo Element %%j: !item[%%j]!
)


::-----Array with sing variable split by comma----
:: Set a single variable with delimited values
set names="mr. a","ms.s","mr.d"

:: Display the variable
echo Names: %names%

:: Loop through the values using a delimiter
for %%a in (%names%) do (
    echo Name: %%~a
)

pause