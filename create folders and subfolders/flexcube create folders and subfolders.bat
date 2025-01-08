@echo off
:: Set baseDir to the directory where the script is located
set "baseDir=%~dp0"

:: Create the main folders
for %%d in ("CHANGE USER" "CLOSE USER" "MAINTENANCE USER" "OPEN USER" "REOPEN USER" "UNLOCK (ENABLE) USER") do (
    mkdir "%baseDir%%%~d"
    
    for %%b in ("001 STB HEAD OFFICE" "002 STB VIENTIANE BRANCH" "003 STB PAKSE BRANCH" "004 STB SAVANAKHET BRANCH" "005 STB LUANGPRABANG BRANCH" "006 STB BOKEO BRANCH" "007 ATTAPEU BRANCH" "008 XIENGKHOUANG BRANCH") do (
        mkdir "%baseDir%%%~d\%%~b"
        
        :: Check if folder is '001 STB HEAD OFFICE' and create 'test' subfolder
        if "%%~b"=="001 STB HEAD OFFICE" (
		for %%u in ("101 Xangjieng Service Unit" "102 Nongteng Service Unit" "103 Dongpalan Service Unit" "104 Saphanthong Service Unit" "105 Dongchong Service Unit" "106 Tanmixay Service Unit" "107 Xaythany Service Unit" "108 Tha-Ngon Service Unit" "109 Suanmone Service Unit" "110 Luk 8 Service Unit" "111 Sikhay Service Unit" "112 Airport Service Unit" "113 Lao-Thai Bridge Service Unit" "114 Naxay Service Unit" "115 Shopping Mall Service Unit" "116 Thatluang Service Unit" "117 Thatluang center Service Unit" "118 Luk 52 Service Unit" "119 Phonesavang Unit Service" "120 Phonetong Service Unit" "121 Donkoy Service Unit" "122 Nongda Service Unit" "123 Huaysiet Service Unit" "124 Nonkhor Service Unit ") do (
            mkdir "%baseDir%%%~d\%%~b\%%~u"
			)
        )
		if "%%~b"=="003 STB PAKSE BRANCH" (
		for %%u in ("151 MARKET -KM8 SERVICE UNIT" "152 MARKET -TRADING SERVICE UNIT" "153 KHONGSEDON DIST SUB SERVICE UNIT" "154 VANGTAO SERVICE UNIT" "155 MIXAY MARKET SERVICE UNIT" "156 PAKSONG SERVICE UNIT") do (
            mkdir "%baseDir%%%~d\%%~b\%%~u"
			)
		)
		if "%%~b"=="004 STB SAVANAKHET BRANCH" (
		for %%u in ("171 SENO Service Unit" "172 SAVANXAY Market Service Unit" "173 XAYBOULY Service Unit" "174 KM9 Service Unit" "175 Dongdamduan Service Unit") do (
            mkdir "%baseDir%%%~d\%%~b\%%~u"
			)
		)
		if "%%~b"=="005 STB LUANGPRABANG BRANCH" (
		for %%u in ("191 CHOUMKHONG Service UNIT" "192 NAVIENGKHAM Service UNIT") do (
            mkdir "%baseDir%%%~d\%%~b\%%~u"
			)
		)
		if "%%~b"=="007 ATTAPEU BRANCH" (
		for %%u in ("251 Saravanh Service Unit") do (
            mkdir "%baseDir%%%~d\%%~b\%%~u"
			)
		)
    )
)

:: Confirm completion
echo Folders and subfolders have been created in "%baseDir%".
pause
