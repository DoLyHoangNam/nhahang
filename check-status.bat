@echo off
echo ========================================
echo    Kiểm tra trạng thái ứng dụng
echo ========================================
echo.

echo Checking Backend (Port 8081)...
netstat -an | findstr ":8081"
if %errorlevel% equ 0 (
    echo ✅ Backend is running on port 8081
) else (
    echo ❌ Backend is NOT running
)
echo.

echo Checking Frontend (Port 5173)...
netstat -an | findstr ":5173"
if %errorlevel% equ 0 (
    echo ✅ Frontend is running on port 5173
) else (
    echo ❌ Frontend is NOT running
)
echo.

echo Checking Database...
if exist "backend\nhahangvietnam.db" (
    echo ✅ Database file exists
    dir backend\*.db
) else (
    echo ❌ Database file not found
)
echo.

echo ========================================
echo URLs:
echo Backend:  http://localhost:8081
echo Frontend: http://localhost:5173
echo ========================================

pause 