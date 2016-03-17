@echo off
title PC Garcil Arithmethic Middle
color 0a
:echo
cls
set /p cant= Entre cuantos n meros quiere hacer la media?
set equal=0
set count=%cant%
if %cant% LSS 2 (goto bad) else (goto answer)
:bad
echo Debes indicar un n mero igual o mayor a 2
cls && goto echo
:answer
set /p num=Escriba uno de los %cant% numeros que promediar 
set /a equal=%equal%+%num%
set /a count=%count%-1
if not %count% == 0 (goto answer)
cls
:resul
set /a resul=%equal%/%cant%
echo La media es %resul%
goto exit
:exit
set /p exit= Desea salir? (y/n)
if %exit%==y (exit)
if %exit%==n (goto echo)
if %exit%=="" (goto bad2)
:bad2
echo Debes indicar "y" o "n"
cls && goto exit
