@echo off
echo ========================================
echo    Nhà Hàng Việt Nam - Full Stack
echo ========================================
echo.

echo Starting Backend (Spring Boot + SQLite)...
start "Backend" cmd /k "cd backend && mvn spring-boot:run"

echo.
echo Waiting 10 seconds for backend to start...
timeout /t 10 /nobreak > nul

echo.
echo Starting Frontend (React)...
start "Frontend" cmd /k "cd nhahangvietnam-main && npm run dev"

echo.
echo ========================================
echo All applications are starting...
echo Backend: http://localhost:8081
echo Frontend: http://localhost:5173
echo Database: nhahangvietnam.db
echo ========================================
echo.
echo Press any key to open in browser...
pause > nul

start http://localhost:5173
start http://localhost:8081

echo.
echo Applications opened in browser!
pause 