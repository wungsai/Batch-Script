@echo off
setlocal EnableDelayedExpansion

SET basePath=%~dp0
set "actions[CHANGE]=CHANGE USER"
set "actions[CLOSE]=CLOSE USER"
set "actions[MAINTENANCE]=MAINTENANCE USER"
set "actions[OPEN]=OPEN USER"
set "actions[REOPEN]=REOPEN USER"
set "actions[REPORT]=REPORT REQUIREMENT"
set "actions[SYSTEM]=SYSTEM MAINTENANCE"
set "actions[UNLOCK]=UNLOCK (ENABLE) USER"


set "branches[001]=001 STB HEAD OFFICE"
set "branches[002]=002 STB VIENTIANE BRANCH"
set "branches[003]=003 STB PAKSE BRANCH"
set "branches[004]=004 STB SAVANAKHET BRANCH"
set "branches[005]=005 STB LUANGPRABANG BRANCH"
set "branches[006]=006 STB BOKEO BRANCH"
set "branches[007]=007 ATTAPEU BRANCH"
set "branches[008]=008 XIENGKHOUANG BRANCH"


set "units[101]=101 Xangjieng Service Unit"
set "units[102]=102 Nongteng Service Unit"
set "units[103]=103 Dongpalan Service Unit"
set "units[104]=104 Saphanthong Service Unit"
set "units[105]=105 Dongchong Service Unit"
set "units[106]=106 Tanmixay Service Unit"
set "units[107]=107 Xaythany Service Unit"
set "units[108]=108 Tha-Ngon Service Unit"
set "units[109]=109 Suanmone Service Unit"
set "units[110]=110 Luk 8 Service Unit"
set "units[111]=111 Sikhay Service Unit"
set "units[112]=112 Airport Service Unit"
set "units[113]=113 Lao-Thai Bridge Service Unit"
set "units[114]=114 Naxay Service Unit"
set "units[115]=115 Shopping Mall Service Unit"
set "units[116]=116 Thatluang Service Unit"
set "units[117]=117 Thatluang center Service Unit"
set "units[118]=118 Luk 52 Service Unit"
set "units[119]=119 Phonesavang Unit Service"
set "units[120]=120 Phonetong Service Unit"
set "units[121]=121 Donkoy Service Unit"
set "units[122]=122 Nongda Service Unit"
set "units[123]=123 Huaysiet Service Unit"
set "units[124]=124 Nonkhor Service Unit"
set "units[151]=151 MARKET -KM8 SERVICE UNIT"
set "units[152]=152 MARKET -TRADING SERVICE UNIT"
set "units[153]=153 KHONGSEDON DIST SUB SERVICE UNIT"
set "units[154]=154 VANGTAO SERVICE UNIT"
set "units[155]=155 MIXAY MARKET SERVICE UNIT"
set "units[156]=156 PAKSONG SERVICE UNIT"
set "units[161]=161 SENO Service Unit"
set "units[162]=162 SAVANXAY Market Service Unit"
set "units[163]=163 XAYBOULY Service Unit"
set "units[164]=164 KM9 Service Unit"
set "units[171]=171 SENO Service Unit"
set "units[172]=172 SAVANXAY Market Service Unit"
set "units[173]=173 XAYBOULY Service Unit"
set "units[174]=174 KM9 Service Unit"
set "units[175]=175 Dongdamduan Service Unit"
set "units[191]=191 CHOUMKHONG Service UNIT"
set "units[192]=192 NAVIENGKHAM Service UNIT"
set "units[251]=251 Saravanh Service Unit"


@REM ::Start Moving File here
for %%f in (*.pdf) do (
    @REM echo -------check-----
    set "file=%%~f"
    echo !file!
    for /f "tokens=1,2 delims= " %%a in ("!file!") do (
        set "action=%%a"
        set "branch=%%b"
    )
    :: Start to find Branch and Unit
    call :findBranch !branch! branch unit
    :: to assign index into the array
    for %%a in (!action!) do (
        set "actionName=!actions[%%a]!"
    )
    for %%a in (!branch!) do (
        set "branchName=!branches[%%a]!"
    )
    for %%a in (!unit!) do (
        set "unitName=!units[%%a]!"
        )
:: Create Branch and Unit Path
if defined unit  (
set "destinationPath=!actionName!\!branchName!\!unitName!"
    
) else (
set "destinationPath=!actionName!\!branchName!"
)

    @REM echo ----base path------
    @REM echo !basePath!
    if not exist "!destinationPath!" (
        mkdir "!destinationPath!"
    )
::---------Move file function and save to log file------------
echo ====move file :^"!file!^" --to-- ^"!destinationPath!^">>move_log.txt
MOVE /Y "!file!" "!destinationPath!\!file!" >>move_log.txt 2>&1
)
pause


goto :eof

:findBranch
set "branchCode=%~1"
@REM echo branchCode is !branchCode!
if !branchCode! equ 1 (
    @REM echo The number !branchCode! is 0.
    set %~2=001
)
if !branchCode! equ 2 (
    @REM echo The number !branchCode! is 1.
    set %~2=002
)
if !branchCode! equ 3 (
    @REM echo The number !branchCode! is 2.
    set %~2=003
)
if !branchCode! equ 4 (
    @REM echo The number !branchCode! is 3.
    set %~2=004
)
if !branchCode! equ 5 (
    @REM echo The number !branchCode! is 4.
    set %~2=005
)
if !branchCode! equ 6 (
    @REM echo The number !branchCode! is 5.
    set %~2=006
)
if !branchCode! equ 7 (
    @REM echo The number !branchCode! is 6.
    set %~2=007
)
if !branchCode! equ 8 (
    @REM echo The number !branchCode! is 7.
    set %~2=008
)
REM 001
if !branchCode! geq 101 if !branchCode! leq 124 (
    @REM echo The number !branchCode! is 001.
)
REM 003
if !branchCode! geq 151 if !branchCode! leq 156 (
    @REM echo The number !branchCode! is 003.
    set %~2=003
    set %~3=!branchCode!
)
REM 004
if !branchCode! geq 171 if !branchCode! leq 175 (
    @REM echo The number !branchCode! is 004.
    set %~2=004
    set %~3=!branchCode!
)
REM 005
if !branchCode! geq 191 if !branchCode! leq 192 (
    @REM echo The number !branchCode! is 005.
    set %~2=005
    set %~3=!branchCode!
)
REM 007
if !branchCode! equ 251 (
    @REM echo The number !branchCode! is 007.
    set %~2=007
    set %~3=!branchCode!
)

:eof