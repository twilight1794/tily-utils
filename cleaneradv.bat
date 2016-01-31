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
