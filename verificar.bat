@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"
set FALTA=0
for %%F in (index.html publico.html config.js netlify.toml css\estilo.css css\slots.css css\contagem.css css\publico-extra.css js\util.js js\ui.js js\imagens.js js\slots.js js\loterias.js js\publico.js js\publico-extras.js js\api.js js\app.js js\carrossel.js js\contagem.js js\contagem-admin.js js\extras-loader.js js\admin-extra.js js\admin-propagandas.js js\admin-usuarios.js js\slots-extra.js) do (
  if exist "%%F" ( echo OK     %%F ) else ( echo FALTA  %%F & set FALTA=1 )
)
echo.
if "%FALTA%"=="0" ( echo TUDO CERTO. Pode publicar com publicar.bat ) else ( echo Copie os arquivos que FALTAM do projeto antigo para as pastas indicadas e rode de novo. )
pause
