@echo off
echo ========================================
echo    Quick Start - Backend
echo ========================================
echo.

echo Starting backend with H2 database...
echo This will create database automatically.
echo.

echo Building and running...
mvn spring-boot:run -DskipTests

pause 