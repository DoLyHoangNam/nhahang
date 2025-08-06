@echo off
echo ========================================
echo    Building Nhà Hàng Việt Nam Backend
echo ========================================
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

echo Cleaning previous build...
mvn clean

echo.
echo Building project...
mvn install -DskipTests

if errorlevel 1 (
    echo.
    echo Error: Build failed!
    pause
    exit /b 1
)

echo.
echo ========================================
echo Build completed successfully!
echo JAR file location: target/backend-0.0.1-SNAPSHOT.jar
echo ========================================
echo.

REM Check if JAR file exists
if exist target\backend-0.0.1-SNAPSHOT.jar (
    echo JAR file created successfully!
    dir target\backend-0.0.1-SNAPSHOT.jar
) else (
    echo Warning: JAR file not found!
)

echo.
echo To run the application:
echo java -jar target/backend-0.0.1-SNAPSHOT.jar
echo.
pause 