@echo off
color 9f
title PC Garcil Cleaner - Limpie su PC en un solo click
echo Bienvenido a PC Garcil Cleaner en un solo click
echo Detectando SO...
echo Detectando archivos del sistema...
echo Analizando basura del sistema...
echo Detectando programas instalados...
echo Detectando basura de aplicaciones...
echo.
echo Presione cualquier tecla para mostrar los resultados...
pause>nul
echo SO: %SO%
echo Nombre de PC: %computername% instalado en %systemdrive%
echo Sistema: %systemroot%
echo Programas: %programfiles%
echo Usuario Actual: %username%
echo Fecha y hora: Hoy es %date% y son las %time%
if exist %systemdrive%\Documents and Settings (set userdir=Documents and Settings) else (set userdir=Users)
pause
:confirm
color cf
set /p confirm=¿Desea limpiar su PC? Responda "y" para si o "n" para no 
if %confirm%==y (goto cleaner)
if %confirm%==n (goto nonexit)
if %confirm%=="" (goto confirm) 
:cleaner
color 0f
del /S /Q %temp%/*.*
del /S /Q %systemroot%\Prefetch\*.*
if exist %systemdrive%\Windows.old (rd /S /Q %systemdrive%\Windows.old)
REM if exist %systemdrive%\MSOCache (rd /S /Q %systemdrive%\MSOCache)
if exist %systemdrive%\%userdir%\%username%\AppData\Local\Google\Chrome\User Data (del /S /Q %systemdrive%\%userdir%\%username%\AppData\Local\Google\Chrome\User Data\*.*)
if exist %systemdrive%\%userdir%\%username%\AppData\Local\Microsoft\Media Player\*.wmdb (del /S /Q %systemdrive%\%userdir%\%username%\AppData\Local\Microsoft\Media Player)
if exist %systemdrive%\%userdir%\%username%\AppData\Local\Microsoft\Windows Photo Gallery\Original Images\*.* (del /S /Q %systemdrive%\%userdir%\%username%\AppData\Local\Microsoft\Windows Photo Gallery\Original Images\*.*)
if exist %systemdrive%\Program Files\Common Files\Windows Live\.cache\*.tmp (del /S /Q %systemdrive%\Program Files\Common Files\Windows Live\.cache\*.tmp)
if exist %systemdrive%\ProgramData\*.* (del /S /Q %systemdrive%\ProgramData)
if exist %systemdrive%\%userdir%\%username%\AppData\Local\CrashDumps\*.* (del /S /Q %systemdrive%\%userdir%\%username%\AppData\Local\CrashDumps\*.*)
if exist %systemroot%\SoftwareDistribution\*.* (del /S /Q %systemroot%\SoftwareDistribution)
if exist %systemdrive%\%userdir%\%username%\AppData\Roaming\Macromedia\Flash Player\*.* (del /S /Q %systemdrive%\%userdir%\%username%\AppData\Roaming\Macromedia\Flash Player\*.*)
if exist %systemdrive%\%userdir%\%username%\Appdata\Local\Microsoft\Windows\Temporary Internet Files\*.* (del /S /Q %systemdrive%\%userdir%\%username%\Appdata\Local\Microsoft\Windows\Temporary Internet Files\*.*)
if exist %systemdrive%\%userdir%\%username%\AppData\Local\Microsoft\Windows\History\*.* (del /S /Q %systemdrive%\%userdir%\%username%\AppData\Local\Microsoft\Windows\History\*.*)
if exist %systemdrive%\%userdir%\%username%\AppData\Roaming\Microsoft\Windows\Cookies\*.* (del /S /Q %systemdrive%\%userdir%\%username%\AppData\Roaming\Microsoft\Windows\Cookies\*.*)
if exist %systemdrive%\%userdir%\%username%\Appdata\index.dat (TASKKILL /F /IM iexplore.exe)
if exist %systemdrive%\%userdir%\%username%\Appdata\index.dat (del /S /Q /A ASHI %systemdrive%\%userdir%\%username%\Appdata\index.dat)
if exist %systemdrive%\%userdir%\%username%\AppData\Roaming\Macromedia\Flash Player\#SharedObjects\*.* (del /S /Q %systemdrive%\%userdir%\%username%\AppData\Roaming\Macromedia\Flash Player\#SharedObjects\*.*)
if exist %systemdrive%\%userdir%\%username%\AppData\Roaming\Mozilla\Firefox\Profiles\*.default (del /S /Q %systemdrive%\%userdir%\%username%\AppData\Roaming\Mozilla\Firefox\Profiles\*.default
del C:\Windows\System32\drivers\etc\hosts
echo 127.0.0.1 localhost>%systemroot%\System32\drivers\etc\hosts
if exist %systemroot%\System32\drivers\etc\hosts (attrib +r +h +s hosts)
powercfg -h off
:exit
color 2f
echo.
echo Su sistema ha sido optimizado el dia %date% a las %time%¡¡¡
pause>nul
echo Gracias por usar nuestro limpiador PC Garcil Cleaner
:reboot
color
set /p reboot=El equipo se debe reiniciar para borrar la basura restante. ¿Desea reiniciar ahora o despues?
if %reboot%==y (shutdown /r /f /t 10 /c "Se reiniciara su equipo en 10 segundos")
if %reboot%==n (exit)
if %reboot%=="" (goto reboot)
:nonexit
echo Ha cancelado el limpiado de su PC
set /p exit=¿Desea salir o regresar al limpiado? (acuerdese: y= si n=no)
if exit=y (exit) else (goto confirm)
