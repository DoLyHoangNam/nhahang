@echo off
echo ========================================
echo    Dừng tất cả ứng dụng
echo ========================================
echo.

echo Stopping processes on port 8081 (Backend)...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8081" ^| findstr "LISTENING"') do (
    echo Stopping PID: %%a
    taskkill /PID %%a /F
)

echo.
echo Stopping processes on port 5173 (Frontend)...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":5173" ^| findstr "LISTENING"') do (
    echo Stopping PID: %%a
    taskkill /PID %%a /F
)

echo.
echo All applications stopped!
pause 