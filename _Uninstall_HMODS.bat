@echo off

echo --------------------------------------------------------------
echo Swingflip's lazy man HMOD uninstaller v1.0
echo http://github.com/swingflip
echo --------------------------------------------------------------
echo This uninstall your hmods from your console
echo --------------------------------------------------------------
echo.
if exist %cd%hakchi\transfer (
	echo Transfer Folder already exists, attempting uninstall file create...
)

if not exist hakchi\transfer (
	mkdir %cd%hakchi\transfer
	echo Created Transfer folder, attempting uninstall file create...
)

rem - Just incase someone is being a tit.
del %cd%hakchi\transfer\*.* 

echo all >> %cd%hakchi\transfer\uninstall

echo Transfered uninstall command successfully. Just plug in run!
echo You're welcome world.

pause