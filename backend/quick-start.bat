@echo off
echo ========================================
echo    Quick Start - Nhà Hàng Việt Nam
echo ========================================
echo.

echo Starting backend...
echo This will create the database automatically.
echo.

REM Check if Java is installed
java -version >nul 2>&1
if errorlevel 1 (
    echo Error: Java is not installed
    pause
    exit /b 1
)

echo Building and starting backend...
echo Please wait, this may take a few minutes...
echo.

mvn spring-boot:run

echo.
echo Backend stopped.
pause 