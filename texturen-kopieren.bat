@echo off
rem Kopiert nur die 131 gebrauchten Texturen aus dem Ordner "block" in zwei Upload-Pakete.
set n=0
for /f %%f in (textures-benoetigt.txt) do call :c %%f
echo.
echo Fertig! Jetzt die Ordner teil1 und teil2 auf GitHub hochladen.
pause
exit /b
:c
set /a n+=1
if %n% leq 100 (set d=teil1) else (set d=teil2)
if not exist "%d%\textures\block" mkdir "%d%\textures\block"
if exist "block\%1" (copy "block\%1" "%d%\textures\block\%1" >nul) else (echo FEHLT: %1)
exit /b
