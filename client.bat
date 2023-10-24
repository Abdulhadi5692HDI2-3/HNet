:: client.bat
@echo off
setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" goto :options
if "%version%" == "6.3" echo [31mUnsupported Windows Version.[0m
if "%version%" == "6.2" echo [31mUnsupported Windows Version.[0m
if "%version%" == "6.1" echo [31mUnsupported Windows Version.[0m
if "%version%" == "6.0" echo echo [31mUnsupported Windows Version.[0m
exit


:options
set /p a=Send Data?[1] or Receive Data? [2] 
if %a%==1 goto :client
if %a%==2 goto :rclient
echo [31mInvalid Option![0m
goto :options


:: function "client"
:: usage client
:client
set /p data=Input data: 
echo Inputted Data: %data%
echo Press any key to send data. . .
pause>nul
call :send "%data%"
goto :eof

:send
curl -X POST -d "data=%~1" http://localhost:8080/server.php
pause
goto :eof

:rclient
echo Press any key to connect and receive data. . .
pause>nul
curl http://localhost:8080/server.php
echo.
echo Press any key to exit. . .
pause>nul
goto :eof
endlocal