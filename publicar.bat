@echo off
cd /d "%~dp0"
rem Usa o Node portatil em %USERPROFILE%\node (sem instalar nada)
if exist "%USERPROFILE%\node\node.exe" set "PATH=%USERPROFILE%\node;%PATH%"
where node >nul 2>nul
if errorlevel 1 ( echo Node nao encontrado. Extraia o zip do Node em %USERPROFILE%\node e rode de novo. & pause & exit /b 1 )
call verificar.bat
echo.
echo Se apareceu FALTA acima, feche esta janela e corrija antes de continuar.
pause
if not exist ".netlify\state.json" (
  call npx --yes netlify-cli login
  call npx --yes netlify-cli sites:create
)
call npx --yes netlify-cli deploy --prod --dir=.
pause
