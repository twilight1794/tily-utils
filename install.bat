set gt=Garcil Tools (R) PC Depelovment Kit v1.0
@echo off
:cnfrm1
set /p cnfrm1=^ Desea instalar %gt%? (y/n)  
if %cnfrm1%==y (goto typeinst)
if %cnfrm1%==n (exit) else (cls & msg * "Debe escribir y o n" & goto cnfrm1)
:typeinst
cls
set /p typeinst= Que tipo de instalacion desea? Rapida (f) o Personalizada (p)
if %typeinst%==f (goto fastinst)
if %typeinst%==p (goto advinst) else (cls & msg * "Debe escribir  f  para una instalacion rapida o  p  para una instalacion personalizada" & goto typeinst)
:fastinst
md "%programfiles%\Garcil Tools"
md "%instdir%\Icons"
set instdir="%programfiles%\Garcil Tools\"
copy *.bat "%instdir%"
copy *.ico "%instdir%\Icons"
:advinst
cls
echo Especifique el directorio de instalacion. Puede usar variables del entorno:
set /p instdir=
:insticon
set /p insticon=^ Desea instalar el paquete de iconos? (y/n) Esto podria aumentar considerablemente el peso de la instalacion.
:exit
msg * "Instalacion Terminada"
echo Gracias por instalar %gt% en su equipo
:exec
set /p exec=^ Desea ejecutar nuestro asistente de personalizacion? (y/n)
if %cnfrm1%==y (start wizard.bat & exit)

if %cnfrm1%==n (exit) else (cls & msg * "Debe escribir y o n" & goto exec)
