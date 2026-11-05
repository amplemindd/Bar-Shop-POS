@echo off
setlocal
cd /d "%~dp0"
echo ============================================
echo          BAR SHOP POS - LOCAL SETUP
echo ============================================
where node >nul 2>nul || (echo Node.js is not installed. Install Node.js LTS first.& pause & exit /b 1)
where npm >nul 2>nul || (echo npm is not available. Reinstall Node.js LTS.& pause & exit /b 1)
if not exist "backend-node\.env" (
  copy "backend-node\.env.example" "backend-node\.env" >nul
  echo Created backend-node\.env. Edit DB_PASSWORD and JWT_SECRET before starting.
)
echo Installing backend dependencies...
npm install
if errorlevel 1 (echo Backend dependency installation failed.& pause & exit /b 1)
echo Installing React frontend dependencies...
cd frontend
call npm install
if errorlevel 1 (echo Frontend dependency installation failed.& pause & exit /b 1)
cd ..
echo.
echo Setup completed. Now:
echo 1. Create database using database\bar_shop_pos.sql in MySQL Workbench.
echo 2. Edit backend-node\.env with your MySQL password and a private JWT_SECRET.
echo 3. Run run-local.bat
pause
