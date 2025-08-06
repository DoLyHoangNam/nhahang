@echo off
echo ========================================
echo    Nhà Hàng Việt Nam - Full Stack
echo ========================================
echo.
echo Starting Backend (Spring Boot + SQLite)...
echo.

REM Start Backend
start "Backend" cmd /k "cd backend && mvn spring-boot:run"

echo Waiting for backend to start...
timeout /t 10 /nobreak >nul

echo.
echo Starting Frontend (React)...
echo.

REM Start Frontend
start "Frontend" cmd /k "cd nhahangvietnam-main && npm run dev"

echo.
echo ========================================
echo All applications are starting...
echo.
echo Backend: http://localhost:8080
echo Frontend: http://localhost:5173
echo Database: nhahangvietnam.db
echo.
echo Press any key to open in browser...
echo ========================================
echo.

pause

REM Open browsers
start http://localhost:8080
start http://localhost:5173

echo.
echo Applications opened in browser!
echo.
echo To stop: Close the command windows
echo.
pause 