::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDFBTQqhPXm2CaYgzO3o5P6IsnE+RuMlYc//07WDL+4X1kb2dIw0mGpUn4UFDxQ4
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJgZkkaHErTXA==
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQITOhpOVUSmNWq3CbsYiA==
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQITOhpOVUSmNWq3CbsYqKW7w+uSrE4VUfBf
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDFBTQqhPXm2CaYgzO3o5P6IsnE+RuMlYc//07WDL+4X1lD0cZc502lmyYVfMA5IehO/a156+lJBpGWfLsOVsgLuREzH41M1ew==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
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