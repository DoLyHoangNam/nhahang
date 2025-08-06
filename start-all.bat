@echo off
echo Starting Backend...
start "Backend" cmd /k "cd backend && mvn spring-boot:run"

timeout /t 5

echo Starting Frontend...
start "Frontend" cmd /k "cd nhahangvietnam-main && npm run dev"

echo Done! Check:
echo Backend: http://localhost:8080
echo Frontend: http://localhost:5173 