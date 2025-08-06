@echo off
echo ========================================
echo    Nhà Hàng Việt Nam Backend - DEV
echo ========================================
echo.
echo Using Development Environment
echo Database file: nhahangvietnam-dev.db
echo.

REM Check if Java is installed
java -version >nul 2>&1
if errorlevel 1 (
    echo Error: Java is not installed or not in PATH
    echo Please install Java 17 or higher
    pause
    exit /b 1
)

REM Check if Maven is installed
mvn -version >nul 2>&1
if errorlevel 1 (
    echo Error: Maven is not installed or not in PATH
    echo Please install Maven 3.6 or higher
    pause
    exit /b 1
)

echo Building project...
mvn clean install -DskipTests

if errorlevel 1 (
    echo Error: Build failed
    pause
    exit /b 1
)

echo.
echo ========================================
echo Starting Spring Boot application (DEV)...
echo Backend will be available at: http://localhost:8080
echo SQLite database: nhahangvietnam-dev.db
echo ========================================
echo.
echo Press Ctrl+C to stop the application
echo.

mvn spring-boot:run -Dspring-boot.run.profiles=dev

pause 