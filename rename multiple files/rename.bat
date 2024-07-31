@echo off
echo ===Rename=====

for /R %%f in (*.!ut) do (
ren "%%f" "%%~nf"
)

pause

