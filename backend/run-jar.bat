@echo off
echo ========================================
echo    Running Nhà Hàng Việt Nam Backend
echo ========================================
echo.

REM Check if JAR file exists
if not exist target\backend-0.0.1-SNAPSHOT.jar (
    echo Error: JAR file not found!
    echo Please run build.bat first to create the JAR file.
    pause
    exit /b 1
)

echo Starting application from JAR file...
echo Backend will be available at: http://localhost:8080
echo SQLite database: nhahangvietnam.db
echo.
echo Press Ctrl+C to stop the application
echo.

java -jar target/backend-0.0.1-SNAPSHOT.jar

pause 