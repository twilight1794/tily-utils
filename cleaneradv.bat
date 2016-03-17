@echo off
title PC Garcil Cleaner (Advanced)
color 0a
echo Bienvenidos a PC Garcil Cleaner En Advanced Mode

:analyze
cls
echo Analizando SO......................................
echo Analizando datos del Sistema.......................
echo Analizando datos del Usuario.......................
if exist "%systemdrive%\Documents and Settings\%username%\Configuraci¢n Local\" (set appdt="%systemdrive%\Documents and Settings\%username%\Configuraci¢n Local\")
if exist "%systemdrive%\Users\%username%\AppData\" (set appdt="%systemdrive%\Users\%username%\AppData\") else (msg * "Tu Sistema No Es Compatible: Usa Windows XP en Adelante" && exit)
if apptd="%systemdrive%\Users\%username%\AppData\" (set alocal="%systemdrive%\Users\%username%\AppData\Local" && set alocallow="%systemdrive%\Users\%username%\AppData\LocalLow" && set aroaming="%systemdrive%\Users\%username%\AppData\Roaming")
echo Escaneando Basura del Sistema......................
if 
echo Escaneando Registro de Windows.....................
echo.
echo.
pause

:result
echo.
echo.
echo Sistema Operativo %OS% instalado en la partición %systemdrive%
echo Equipo: %COMPUTERNAME%
echo Procesador: %PROCESSOR_IDENTIFIER% %PROCESSOR_ARCHITECTURE%
echo Usuario: %USERNAME% en %USERPROFILE%
echo Fecha: %DATE%    Hora: %TIME%
echo.
echo.
pause
cls

:confirm
echo.
set /p help=¿Desea ir a la ayuda o continuar? (y-^>Ayuda   n-^>Continuar) 
if %help%==y (goto help)
if %help%==n (goto temp)
if %help%=="" (echo. && echo Debe especificar "y"-^>Ayuda o "n"-^>Continuar && pause>nul && cls && goto confirm)

:temp
set /p temp=¿Desea eliminar los archivos temporales del sistema?
if %temp%==y (del /s /q %temp%\*.*) else (goto w_old)

:w_old
if exist %systemdrive%\Windows.old (set /p wold=¿Desea borrar los residuos de instalaciones anteriores de Windows? C:\Windows.old se drea automaticamente cuando se hace una instalacion de Windows nueva sin formatear la existente.) else (goto mscache)
if %wold%==y (del /s /q %systemdrive%:\Windows.old) else (goto mscache)

:mscache
if exist %systemdrive%\MSOCache\ (set /p mscache=¿Desea eliminar la caché de instalación de Microsoft Office? Estos archivos se crean para instalar mas componentes si así se desea. Si no lo necesita puede eliminarlos) else (goto hibern)
if %mscache%==y (del /s /q %homedrive%\MSOCache) else (goto hibern)

:hibern
set /p hibern=¿Desea deshabilitar la hibernación? Esta funcionalidad necesita de un archivo ^(%homedrive%\hiberfil.sys^) tiene aproximadamente el tamaño de su memoria RAM, si lo deshabilita puede liberar una cant. considerable de memoria.
if %hibern%==y (powercfg -h off) else (goto prefetch)

:prefetch
set /p prftch=¿Desea eliminar los archivos de Prefetch?
if %prftch%==y (del /s /q %systemroot%\Prefetch\) else (goto flplay)

:flplay
set /flplay=¿Desea eliminar la caché de Flash Player?
if %flplay%==y (
if exist %aroaming% (del /s /q "%aroaming%\Macromedia\Flash Player") else (del /s /q "%appdt%\Macromedia\Flash Player")
) else (goto nettemp)

:nettemp
set /p nettemp=¿Desea eliminar los temporales de Internet?
if %nettemp%==y (
if exist %alocal% (del /s /q "%alocal%\Microsoft\Windows\Temporary Internet Files\") else (del /s /q "")
) else (goto history)

del %homedrive%ProgramData/Microsoft/Search/Dat/Application/ /s /q
goto winlive
:winlive
set /p winlive=¿Desea limpiar la cache de Windows Live?
if %winlive% == y (goto 9so)
:9so
del %systemdrive%/ProgramData/Installations/*.* /s /q 
goto installdata
:installdata
set /p installd=¿Desea eliminar los archivos temporales de instalaciones?
if %installd% == y (goto 10so)
:10so
del "%programfiles%/Common Files/Windows Live/.cache/*.*" /s /q
goto crshdps
:crshdps
set /p crshdps=¿Desea eliminar los informes de errores?
if %crshdps% == y (goto 11so) else (goto 12so)
:11so
if exist "%systemdrive%/Documents and Settings/" (del %appdata% /s /q && goto softdisk)
if exist "%systemdrive%/Users/" (del %appdata%/Local/CrashDumps /s /q && goto softdisk)
:softdisk
set /p softdisk=¿Desea eliminar la informacion sobre actualizaciones?
if %softdisk% == y (goto 12so)
:12so
del %systemroot%/SoftwareDistribution/*.* /s /q && goto spoolprn)
:spoolprn
set /p spoolprn=¿Desea eliminar la cola de impresion? (y/n)
if %spoolprn% == y (del %systemroot%/System32/Spool/Printers/*.* /s / && goto ending)
:ending
set /p ending=¿Desea comprobar la limpieza con el liberador de Disco de Windows?
if %ending% == y (cleanmgr /sagerun:64)
:exit
echo Gracias por usar PC Garcil Cleaner v1.0
exit
