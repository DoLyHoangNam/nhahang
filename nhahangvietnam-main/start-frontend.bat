@echo off
echo ========================================
echo    Nhà Hàng Việt Nam Frontend
echo ========================================
echo.
echo Starting React Development Server
echo Frontend will be available at: http://localhost:5173
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if errorlevel 1 (
    echo Error: Node.js is not installed or not in PATH
    echo Please install Node.js 16 or higher
    pause
    exit /b 1
)

REM Check if npm is installed
npm --version >nul 2>&1
if errorlevel 1 (
    echo Error: npm is not installed or not in PATH
    echo Please install npm
    pause
    exit /b 1
)

REM Check if node_modules exists
if not exist node_modules (
    echo Installing dependencies...
    npm install
    if errorlevel 1 (
        echo Error: Failed to install dependencies
        pause
        exit /b 1
    )
)

echo.
echo ========================================
echo Starting React Development Server...
echo Frontend URL: http://localhost:5173
echo Backend URL: http://localhost:8080
echo ========================================
echo.
echo Press Ctrl+C to stop the server
echo.

npm run dev

pause 