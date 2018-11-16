@ECHO OFF
title Arduino Uploader
color 0b
echo.
echo.
echo.
echo.   ###               ##           ##                        ##     ##           ##                        ##
echo.   ###               ##           ##                        ##     ##           ##                        ##
echo.  ## ##              ##                                     ##     ##           ##                        ##
echo.  ## ##   ## ##   ## ##  ##   ##  ##  ## ###     ###        ##     ##  ## ##    ##    ###     ####     ## ##    ###    ## ##
echo.  ## ##   #####  ######  ##   ##  ##  #######   #####       ##     ##  ######   ##   #####   ######   ######   #####   #####
echo. ##   ##  ###   ### ###  ##   ##  ##  ###  ##  ### ###      ##     ##  ### ###  ##  ### ###      ##  ### ###  ##   ##  ###
echo. #######  ##    ##   ##  ##   ##  ##  ##   ##  ##   ##      ##     ##  ##   ##  ##  ##   ##    ####  ##   ##  #######  ##
echo. #######  ##    ##   ##  ##   ##  ##  ##   ##  ##   ##      ##     ##  ##   ##  ##  ##   ##   ## ##  ##   ##  #######  ##
echo. #     ## ##    ### ###  ##  ###  ##  ##   ##  ### ###      ###   ###  ### ###  ##  ### ###  ##  ##  ### ###  ##       ##
echo. #     ## ##     ######  #######  ##  ##   ##   #####        #######   ######   ##   #####   ######   ######   ######  ##
echo. #     ## ##      ## ##   ### ##  ##  ##   ##    ###          #####    ## ##    ##    ###     ### ##   ## ##    ####   ##
echo.                                                                       ##
echo.                                                                       ##
echo.                                                                       ##
echo.

:verify
echo.
echo  Ready to start verify and upload your program.
echo.
pause

cd /d %~dp0
cd /d "%cd%\Tools\XLoader"
start XLoader.exe
choice /t 1 /d y /n >nul
set /p projectName= < "%cd%\ProjectName"
set /p port= < "%cd%\SerialPortLists"
cd /d ".."
cd /d ".."

"C:\Program Files (x86)\Arduino\arduino-builder" ^
-compile ^
-logger=human ^
-hardware "C:\Program Files (x86)\Arduino\hardware" ^
-hardware "C:\Users\%USERNAME%\AppData\Local\Arduino15\packages" ^
-hardware "C:\Users\%USERNAME%\Documents\Arduino\hardware" ^
-tools "C:\Program Files (x86)\Arduino\tools-builder" ^
-tools "C:\Program Files (x86)\Arduino\hardware\tools\avr" ^
-tools "C:\Users\%USERNAME%\AppData\Local\Arduino15\packages" ^
-built-in-libraries "C:\Program Files (x86)\Arduino\libraries" ^
-libraries "C:\Users\%USERNAME%\Documents\Arduino\libraries" ^
-fqbn=arduino:avr:uno ^
-vid-pid=0X2341_0X0043 ^
-ide-version=10805 ^
-build-path "%cd%\Tools\build" ^
-warnings=all ^
-prefs=build.warn_data_percentage=75 ^
-prefs=runtime.tools.avr-gcc.path="C:\Program Files (x86)\Arduino\hardware\tools\avr" ^
-prefs=runtime.tools.avr-gcc-5.4.0-atmel3.6.1-arduino2.path="C:\Program Files (x86)\Arduino\hardware\tools\avr" ^
-verbose "%cd%\%projectName%\%projectName%.ino" ^

echo.
echo.
echo Attempting to connect serial port:%port%...
echo.
echo.

Tools\avrdude\avrdude -C%cd%\Tools\avrdude\avrdude.conf -carduino -b115200 -D -v -patmega328p -P%port% -Uflash:w:%cd%\Tools\build\%projectName%.ino.hex:i

if errorlevel 1 (
echo ***************************** Upload failed, Please try again!  ********************************
)else (
echo ----------------------------- Done uplaoded, Congratulations!  --------------------------------
)

echo.
xcopy /s /i /y ".\Tools\build\%projectName%.ino.hex" ".\Tools\"
DEL .\Tools\build\%projectName%.ino.hex
goto verify
