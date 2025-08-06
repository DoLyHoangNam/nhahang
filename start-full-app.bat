@echo off
echo ========================================
echo    Nhà Hàng Việt Nam - Full Stack App
echo ========================================
echo.
echo Starting both Frontend and Backend
echo.

REM Check if Java is installed
java -version >nul 2>&1
if errorlevel 1 (
    echo Error: Java is not installed or not in PATH
    echo Please install Java 17 or higher
    pause
    exit /b 1
)

REM Check if Node.js is installed
node --version >nul 2>&1
if errorlevel 1 (
    echo Error: Node.js is not installed or not in PATH
    echo Please install Node.js 16 or higher
    pause
    exit /b 1
)

echo ========================================
echo Starting Backend (Spring Boot)...
echo ========================================
echo.

REM Start backend in background
start "Backend" cmd /k "cd backend && run.bat"

echo Waiting for backend to start...
timeout /t 10 /nobreak >nul

echo.
echo ========================================
echo Starting Frontend (React)...
echo ========================================
echo.

REM Start frontend in background
start "Frontend" cmd /k "cd nhahangvietnam-main && start-frontend.bat"

echo.
echo ========================================
echo Both applications are starting...
echo.
echo Backend: http://localhost:8080
echo Frontend: http://localhost:5173
echo.
echo Press any key to open applications in browser
echo ========================================
echo.

pause

REM Open browsers
start http://localhost:8080
start http://localhost:5173

echo.
echo Applications opened in browser!
echo.
echo To stop applications:
echo - Close the command windows
echo - Or press Ctrl+C in each window
echo.
pause 