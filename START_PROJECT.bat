@echo off
echo ========================================================
echo   Starting Pharmacy Drug Management System
echo ========================================================
echo.

set TOMCAT_HOME=C:\tomcat\apache-tomcat-10.1.57

echo [1/3] Copying latest files to Tomcat webapps...
if not exist "%TOMCAT_HOME%\webapps\pharmacy" mkdir "%TOMCAT_HOME%\webapps\pharmacy"
xcopy /E /I /Y "Pharmacy-Drug-Mangement\WebContent" "%TOMCAT_HOME%\webapps\pharmacy" > nul

echo [2/3] Checking if Tomcat is already running on port 8081...
netstat -ano | findstr 8081 > nul
if %errorlevel% equ 0 (
    echo Tomcat is already running on port 8081.
) else (
    echo Starting Tomcat server...
    start "Tomcat Server" "%TOMCAT_HOME%\bin\catalina.bat" run
    timeout /t 4 > nul
)

echo [3/3] Opening application in your browser...
start http://localhost:8081/pharmacy/Index.html

echo.
echo Application URL: http://localhost:8081/pharmacy/Index.html
echo Setup completed successfully!
pause
