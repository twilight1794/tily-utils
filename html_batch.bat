@ECHO OFF
title Tily HTML Batch 1.0
:project
echo Bienvenido a este programa para crear páginas web html...
echo ¿Que deseas hacer?
echo -1- Para empezar un proyecto nuevo, pulsa 1
echo -2- Para continuar un proyecto existente, pulsa 2
echo -3- Para salir del programa, pulsa S
set/p project=?
if %project%==s (exit)
if %project%==1 (goto continue1)
if %project%==2 (goto continue2) else (echo. && echo Incorrecto && goto proyecto)
 
 
:continue1
set/p namep=Escriba el nombre del archivo del proyecto...
echo Se creara un archivo de proyecto con el nombre: %namep%.html
echo Pulse cualquier tecla para comenzar
pause>nul
cls
goto start
 
 
:continue2
set/p namep=Escribe el nombre del archivo de proyecto para continuar...
if exist==%namep%.html (goto continue3) else (goto err1)
 
 
:continue3
echo Se continuara con el proyecto %namep%.html
echo Para proseguir, pulsa cualquier tecla.
 pause>nul
cls
goto primer_menu
 
 
:err1
echo El nombre del archivo no se encuentra...
echo ¿Deseas crear un proyecto nuevo con el nombre especificado?
echo Para decir que si, pulsa s
echo Para decir que no, pulsa n
set/p err1=?
if %err1%==s (goto c-proj)
if %err1%==n (goto continue2) else (echo. && echo Incorrecto && cls && goto project)
 
 
:c-proj
echo Se creara un archivo de proyecto con el nombre: %namep%.html
echo Para continuar, pulsa cualquier tecla.
 pause>nul
cls
goto start
 
 
:start
set /p titlep= Dime el título de tu página...
set /p programmer= Dime tu nombre...
echo Desea añadir una hoja de estilo CSS a tu documento?
echo Para decir que si, pulsa s
echo Caso contrario, escriba n
set /p %stylesheet%=s (echo Escriba la ubicación de la hoja CSS && set /p style=)
ECHO ^<!DOCTYPE HTML^>
ECHO ^<html^ lang="es"> >> %namep%.html
ECHO ^<head^> >> %namep%.html
ECHO ^<meta name="author" content="%programmer%"> >> %namep%.html
ECHO ^<title^>%titlep%^</title^> >> %namep%.html
ECHO ^<link^ rel="stylesheet" type="text/css" src="%style%">
ECHO ^</head^> >> %namep%.html
cls
echo ^<body^> >> %namep%.html
cls
goto firstm
 
 
:firstm
echo Escribe lo que deseas hacer, luego pulsa enter.
echo Para crear encabezados, pulsa 1
echo Para crear enlaces, pulsa 2
echo Para crear botones, pulsa 3
echo Para escribir texto, pulsa 4
echo Para crear listas, pulsa 5
echo Para terminar el documento HTML, pulsa f
echo Para salir del programa, pulsa s
set/p wish=?
if %wish%==1 (goto headers)
if %wish%==2 (goto links)
if %wish%==3 (goto buttons)
if %wish%==4 (goto text)
if %wish%==5 (goto lists)
if %wish%==f (goto endp)
if %wish%==s (exit) else (echo.&& echo la opción es incorrecta && goto firstm)
 
 
:headers
cls
set/p hdr= Escribe el texto del encabezado...
ECHO ^<h1^>%hdr%^</h1^> >> %namep%.html
echo Se ha creado el encabezado....
cls
goto firstm
 
 
:links
cls
set/p dosa= Escribe la direccion del enlace...
set/p dosb= Escribe el texto del enlace...
echo ^<a href="http://%dosa%"^>%dosb%^</a^> >> %namep%.html
cls
goto firstm
 
 
:buttons
cls
echo Elige el tipo de boton:
echo Para botones a direcciones, pulsa 1
echo Para botones con comandos JavaScript o VBScript, pulsa 2
echo Para volver al menu anterior, pulsa v
 
set/p b1=?
if %b1%==1 (goto b-dirs)
if %b1%==2 (goto b-commands)
if %b1%==v (goto firstm) else (echo. && echo incorrecto && goto botones)
 
:b-dirs
set/p tresa= Escribe la direccion del boton...
set/p tresb= Escribe el texto del boton...
echo ^<input type="button" value="%tresb%" onClick="self.location.href=('http://%tresa%')"^> >> %namep%.html
cls
goto firstm
 
:b-commands
set/p tresa= Escribe el comando del boton...
set/p tresb= Escribe el texto del boton...
echo ^<input type="button" value="%tresb%" onClick="%tresa%"^> >> %namep%.html
cls
goto firstm
 
:lists
cls
echo ^<ul^> >> %namep%.html
echo Elige una de las opciones siguientes, luego pulsa entrar:
echo Para agregar un elemento, pulsa 1
echo Para cerrar la lista, pulsa 2
echo Para volver al menu anterior, pulsa v
 
set/p lista-1=?
if %lista-1%==1 (goto add-list)
if %lista-1%==2 (goto end-list)
if %lista-1%==v (goto firstm) else (echo. && echo Incorrecto && goto lists)
 
:add-list
set/p texlist= Escribe el texto a insertar:
echo ^<li^>%texlist%^</li^> >> %namep%.html
cls
goto lists
 
:end-list
echo ^</ul^> >> %namep%.html
cls
goto firstm
 
 
:text
set/p text= Escribe el texto a mostrar....
echo ^<p^>%text%^</p^> >> %namep%.html
cls
goto firstm
 
 
:endp
echo ^</body^> >> %namep%.html
echo ^</html^> >> %namep%.html
echo Se ha finalizado tu proyecto, gracias por utilizar mi programa.
echo Para continuar, pulsa cualquier tecla.
pause>nul
cls
goto project
