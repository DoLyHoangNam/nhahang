@echo off
echo ========================================
echo    Quick Database Check
echo ========================================
echo.

echo Checking for database file...
if exist nhahangvietnam.mv.db (
    echo ✅ Database file found: nhahangvietnam.mv.db
    echo File size:
    dir nhahangvietnam.mv.db
    echo.
    echo Database is ready!
) else (
    echo ❌ Database file not found: nhahangvietnam.mv.db
    echo.
    echo To create database:
    echo 1. Run: run.bat
    echo 2. Or run: mvn spring-boot:run
    echo.
)

echo.
echo Checking if backend is running...
netstat -an | findstr :8080 >nul
if errorlevel 1 (
    echo ❌ Backend not running on port 8080
    echo.
    echo To start backend:
    echo 1. Run: run.bat
    echo 2. Or run: mvn spring-boot:run
) else (
    echo ✅ Backend is running on port 8080
    echo.
    echo You can access:
    echo - Backend API: http://localhost:8080
    echo - Frontend: http://localhost:5173
)

echo.
pause 