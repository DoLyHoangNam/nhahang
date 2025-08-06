@echo off
echo ========================================
echo    Building Nhà Hàng Việt Nam Frontend
echo ========================================
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
echo Building React application...
npm run build

if errorlevel 1 (
    echo.
    echo Error: Build failed!
    pause
    exit /b 1
)

echo.
echo ========================================
echo Build completed successfully!
echo Build files location: dist/
echo ========================================
echo.

REM Check if dist folder exists
if exist dist (
    echo Build files created successfully!
    dir dist
) else (
    echo Warning: Build files not found!
)

echo.
echo To serve the built files:
echo npm run preview
echo.
pause 