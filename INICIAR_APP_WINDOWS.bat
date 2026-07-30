@echo off
cd /d "%~dp0"
where node >nul 2>&1 || (echo Instala Node.js 22 o superior y vuelve a intentarlo.& pause & exit /b 1)
start "" http://localhost:3000
node server.js
pause
