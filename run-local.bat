@echo off
setlocal
cd /d "%~dp0"
if not exist "backend-node\.env" (
  echo Missing backend-node\.env. Run setup-local.bat first.
  pause
  exit /b 1
)
if not exist "node_modules" (
  echo Backend dependencies missing. Run setup-local.bat first.
  pause
  exit /b 1
)
if not exist "frontend\node_modules" (
  echo Frontend dependencies missing. Run setup-local.bat first.
  pause
  exit /b 1
)
echo Starting Bar Shop POS on this computer only...
start "Bar Shop POS Backend" cmd /k "cd /d ""%~dp0"" && npm start"
start "Bar Shop POS Frontend" cmd /k "cd /d ""%~dp0frontend"" && npm start"
timeout /t 3 /nobreak >nul
start http://localhost:3000
echo.
echo Frontend: http://localhost:3000
echo Backend:  http://localhost:5000/api/health
echo Keep both terminal windows open while using the app.
