@echo off
REM QR Data Transfer - Windows Setup Script
REM This script initializes the git repository and prepares for first push

echo.
echo ========================================
echo  QR Data Transfer - Repository Setup
echo ========================================
echo.

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git is not installed!
    echo Please install Git from: https://git-scm.com/download/win
    echo.
    pause
    exit /b 1
)

REM Initialize git if not already initialized
if not exist .git (
    echo [1/3] Initializing git repository...
    git init
    echo       Done!
) else (
    echo [1/3] Git already initialized
)

echo.
echo [2/3] Adding files to git...
git add .
echo       Done!

echo.
echo [3/3] Creating initial commit...
git commit -m "Initial commit: QR Data Transfer app with documentation"
echo       Done!

echo.
echo ========================================
echo  Repository Ready!
echo ========================================
echo.
echo NEXT STEPS:
echo.
echo 1. Create a new repository on GitHub:
echo    https://github.com/new
echo.
echo 2. Run these commands (replace YOUR_USERNAME and YOUR_REPO):
echo.
echo    git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
echo    git branch -M main
echo    git push -u origin main
echo.
echo 3. Enable GitHub Pages:
echo    - Go to Settings (on GitHub)
echo    - Click Pages
echo    - Select 'main' branch
echo    - Click Save
echo.
echo 4. Your app will be live at:
echo    https://YOUR_USERNAME.github.io/YOUR_REPO
echo.
echo For other deployment options, see docs\DEPLOYMENT.md
echo.
pause
