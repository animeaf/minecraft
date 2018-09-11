@echo off
title Crazy Diamond Launcher
rem Version 0.2.0.1
color E
set /p actualVersion= < data\version.zax
del /s update.exe 1>nul 2>nul
del /s update%actualVersion%.exe 1>nul 2>nul
cd data
set /p mcbase= < base.zax
if "%mcbase%"=="n" (
    del /s cache\base.zip 1>nul 2>nul
    echo.
    echo Descargando archivos necesarios...
    echo.
    wget -q --show-progress https://github.com/animeaf/minecraft/releases/download/1.0/base.zip -P cache
    7za  x -bso0 -aoa cache\base.zip -o..\
    del /s cache\base.zip 1>nul
    echo y > base.zax
)
wget -q https://raw.githubusercontent.com/animeaf/minecraft/master/version.zax -P cache
set /p checkedVersion= < cache\version.zax
del /s cache\version.zax 1>nul
if %checkedVersion% gtr %actualVersion% (
    del /s cache\update%checkedVersion%.zip 1>nul 2>nul
    echo.
    echo Descargando Update %checkedVersion%...
    echo.
    wget -q --show-progress https://github.com/animeaf/minecraft/releases/download/%checkedVersion%/update%checkedVersion%.zip -P cache
    7za  x -bso0 -aoa cache\update%checkedVersion%.zip -o..\
    del /s cache\update%checkedVersion%.zip 1>nul
    start ..\update%checkedVersion%.exe
    echo hola
    goto salir
)
cd ..\minecraft
start launcher.exe
:salir
exit
