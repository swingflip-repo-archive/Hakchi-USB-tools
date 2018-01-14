@echo off
mode con: cols=80 lines=35
color 0A

rem Update these 3 variables if you intend to update the script...
REM Note: Change this to auto fetch the latest build
SET HakchiBuild=hakchi2-dantheman827-linked-export-6188a0a
SET HakchiBuildURL=http://classicmods.net/repo/usb-host/hakchi2-dantheman827-linked-export-latest.zip
SET HakchiBuildLastUpdated=5th January 2018

echo   __  _________    _____  _______________   __   _______________ 
echo  / / / / __/ _ )  /  _/ ^|/ /  _/_  __/ _ ^| / /  /  _/ __/ __/ _ \
echo / /_/ /\ \/ _  ^| _/ //    // /  / / / __ ^|/ /___/ /_\ \/ _// , _/
echo \____/___/____/ /___/_/^|_/___/ /_/ /_/ ^|_/____/___/___/___/_/^|_^| 
echo.                                                                 
echo --------------------------------------------------------------------------------
echo Swingflip's lazy man USB Initialiser v1.0
echo http://github.com/swingflip
echo --------------------------------------------------------------------------------
echo This will initalise the following USB drive: %cd%
echo It will install USB-HOST Hakchi build:
echo %HakchiBuild%
echo This was the latest version as of: %HakchiBuildLastUpdated%
echo --------------------------------------------------------------------------------
:Ask
echo Are you happy to proceed?(Y/N)
set INPUT=
set /P INPUT=Type input: %=%
If /I "%INPUT%"=="y" goto yes 
If /I "%INPUT%"=="n" goto no
echo Incorrect input & goto Ask
:yes
echo.
rem lets do this shit...

rem this is a fucking pain. Just botch it with the above variables for now.
rem if not exist %cd%bin\PortableGit (
rem	echo ERROR: Couldn't find the PortableGit folder in your USB (re-download my package and make sure you copied the bin folder too...
rem	pause
rem	exit /b
rem )

echo checking internet connection...
Ping www.google.com -n 1 -w 1000>nul 2>&1
cls
if errorlevel 1 (set internet=N) else (set internet=Y)

if internet =="N" (
	echo [ERROR] - You are not connected to the internet! Make sure you connect to the net first!
	pause
	exit /b
)
echo   __  _________    _____  _______________   __   _______________ 
echo  / / / / __/ _ )  /  _/ ^|/ /  _/_  __/ _ ^| / /  /  _/ __/ __/ _ \
echo / /_/ /\ \/ _  ^| _/ //    // /  / / / __ ^|/ /___/ /_\ \/ _// , _/
echo \____/___/____/ /___/_/^|_/___/ /_/ /_/ ^|_/____/___/___/___/_/^|_^| 
echo.                                                                 
echo --------------------------------------------------------------------------------
echo Swingflip's lazy man USB Initialiser v1.0
echo http://github.com/swingflip
echo --------------------------------------------------------------------------------
echo This will initalise the following USB drive: %cd%
echo --------------------------------------------------------------------------------
echo.
echo Creating file structure for the USB device...
mkdir %cd%data
mkdir %cd%data\log
mkdir %cd%data\transfer_backup
mkdir %cd%data\extras
mkdir %cd%data\hakchi2
mkdir %cd%hakchi
mkdir %cd%hakchi\saves
mkdir %cd%hakchi\games
mkdir %cd%hakchi\fonts
mkdir %cd%hakchi\firmware
echo [OK] - Created the file structure!
echo.
echo Checking for internet connection...
echo [OK] - Connected to the internet!
echo.
echo Downloading the latest Hakchi USB edition...
if exist %cd%package (
del %cd%package.zip
)
powershell.exe -command "(New-Object Net.WebClient).DownloadFile('%HakchiBuildURL%', 'package.zip')"
if not %errorlevel%==0 (
	echo [ERROR] - Couldn't download Hakchi from URL: %HakchiBuildURL%
	pause
	exit /b
)
echo [OK] - Downloaded successfully!
echo.
echo Unzipping package...
powershell.exe -nologo -noprofile -command "& { $shell = New-Object -COM Shell.Application; $target = $shell.NameSpace('%cd%data\hakchi2'); $zip = $shell.NameSpace('%cd%package.zip'); $target.CopyHere($zip.Items(), 16); }"
if not %errorlevel%==0 (
	echo [ERROR] - Couldn't download unzip downloaded package
	del %cd%package.zip
	pause
	exit /b
)
del %cd%package.zip
echo [OK] - Unzipped succesfully!
rem derp ignore this.
rem fuck this. In fact it's prob better to have the build name in there too...
rem echo renaming package to something useful...
rem rename "%cd%data\%HakchiBuild%" "%cd%data\hakchi2\"
rem echo [OK] - renamed successfully!
echo.
echo --------------------------------------------------------------------------------
echo      SUCCESS! USB is initialised. Everything seemed to set up correctly....
echo --------------------------------------------------------------------------------
echo.
echo You're welcome world :)
echo.
echo Press any key to exit this installer...
pause>nul 2>&1

:no
exit /b