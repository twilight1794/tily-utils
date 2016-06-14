@echo off
title PC Garcil Password Locker v1.0
color 0a
echo Escribir la ubicacion del archivo que desea ocultar con contraseña,es recomendable
echo que tenga deshabilitada la opcion "Ver archivos del Sistema" en Propiedades del Sistema
:conf
echo.
echo.
set /p confirm=Desea continuar? (y/n)
if %confirm%==y (goto password)
if %confirm%==n (exit)
if %confirm%=="" (goto error)
:error
echo Debe escribir "y" o "n"
pause > nul
cls && goto conf
:password
echo Escriba la Ubicacion del Archivo:
echo Ej: C:\Users\%username%\Desktop\
set /p dir=
cls
set /p name=Escriba el nombre del archivo: 
cls
:asign
set /p pass=Escriba la contrase a que desea poner al archivo: 
echo.
set /p pass2=Escriba de nuevo la contrase a: 
if %pass%==%pass2% (goto protect) else (echo LAs contrase as no coinciden & pause>nul & cls & goto asign)
attrib +a +s +h %dir%\%name%
echo @echo off >> %dir%\%name%
echo Title Autentificaci n %name% >> %dir%\%name%
echo Para abrir su archivo %name% introduzca la contrase a: >> %dir%\%name%
echo set /p psw= >> %dir%\%name%
echo if %psw%==%password% (%dir%\%name%) else (echo Contrase a Incorrecta && exit) >> %dir%\%name%
cls
echo Contraseña Aplicada!!!
pause>nul
exit
