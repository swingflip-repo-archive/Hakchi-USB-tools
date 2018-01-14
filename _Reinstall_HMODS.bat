@echo off

echo --------------------------------------------------------------
echo Swingflip's lazy man HMOD installer v1.0
echo http://github.com/swingflip
echo --------------------------------------------------------------
echo This will transfer your hmods from:
echo %cd%data\transfer_backup
echo --------------------------------------------------------------
echo.
if not exist %cd%data\transfer_backup (
	echo ERROR: Couldn't find the data\transfer_backup\ folder in your USB...
	pause
	exit /b
)

if exist %cd%hakchi\transfer (
	echo Transfer Folder already exists, attempting hmod copy...
)

if not exist hakchi\transfer (
	mkdir %cd%hakchi\transfer
	echo Created Transfer folder, attempting hmod copy...
)

rem - Just incase someone is being a tit.
del %cd%hakchi\transfer\*.* 

xcopy /y %cd%data\transfer_backup %cd%hakchi\transfer

echo Transfered hmods successfully. Just plug in run!
echo You're welcome world.

pause