@echo off
echo ========================================
echo  Serious Engine 1.60 - Development Kit
echo ========================================
echo.

echo Configurando entorno de desarrollo...

REM Configurar variables de entorno
set SE_ROOT=%~dp0
set SE_SOURCES=%SE_ROOT%Sources
set SE_TOOLS=%SE_ROOT%Tools
set SE_BUILD=%SE_ROOT%Build

echo SE_ROOT=%SE_ROOT%
echo SE_SOURCES=%SE_SOURCES%
echo SE_TOOLS=%SE_TOOLS%
echo SE_BUILD=%SE_BUILD%
echo.

echo Verificando herramientas necesarias...

REM Verificar Ecc.exe
if exist "%SE_TOOLS%\execute\Ecc.exe" (
    echo [OK] Ecc.exe encontrado
) else (
    echo [ERROR] Ecc.exe no encontrado en Tools\execute\
    pause
    exit /b 1
)

REM Verificar bison.exe
if exist "%SE_TOOLS%\execute\bison.exe" (
    echo [OK] bison.exe encontrado
) else (
    echo [ERROR] bison.exe no encontrado en Tools\execute\
    pause
    exit /b 1
)

REM Verificar flex.exe
if exist "%SE_TOOLS%\execute\flex.exe" (
    echo [OK] flex.exe encontrado
) else (
    echo [ERROR] flex.exe no encontrado en Tools\execute\
    pause
    exit /b 1
)

echo.
echo Todas las herramientas verificadas correctamente!
echo.

echo ========================================
echo  Opciones disponibles:
echo ========================================
echo 1. Compilar entidades (pre_compile_entities.bat)
echo 2. Compilar archivos .es (pre_compile_es.bat)
echo 3. Abrir Visual Studio con la solucion principal
echo 4. Abrir WorldEditor
echo 5. Abrir Modeler
echo 6. Abrir SeriousSkaStudio
echo 7. Ejecutar DedicatedServer
echo 8. Ver documentacion
echo 9. Salir
echo.

:menu
set /p choice="Selecciona una opcion (1-9): "

if "%choice%"=="1" goto compile_entities
if "%choice%"=="2" goto compile_es
if "%choice%"=="3" goto open_vs
if "%choice%"=="4" goto open_worldeditor
if "%choice%"=="5" goto open_modeler
if "%choice%"=="6" goto open_skastudio
if "%choice%"=="7" goto run_server
if "%choice%"=="8" goto show_docs
if "%choice%"=="9" goto exit

echo Opcion invalida. Intenta de nuevo.
goto menu

:compile_entities
echo.
echo Compilando entidades...
cd /d "%SE_BUILD%"
call pre_compile_entities.bat
pause
goto menu

:compile_es
echo.
echo Compilando archivos .es...
cd /d "%SE_BUILD%"
call pre_compile_es.bat
pause
goto menu

:open_vs
echo.
echo Abriendo Visual Studio...
cd /d "%SE_BUILD%"
start Build_2010.sln
goto menu

:open_worldeditor
echo.
echo Abriendo WorldEditor...
cd /d "%SE_TOOLS%\WorldEditor"
if exist "WorldEditor.exe" (
    start WorldEditor.exe
) else (
    echo WorldEditor.exe no encontrado. Compila primero el proyecto.
    pause
)
goto menu

:open_modeler
echo.
echo Abriendo Modeler...
cd /d "%SE_TOOLS%\Modeler"
if exist "Modeler.exe" (
    start Modeler.exe
) else (
    echo Modeler.exe no encontrado. Compila primero el proyecto.
    pause
)
goto menu

:open_skastudio
echo.
echo Abriendo SeriousSkaStudio...
cd /d "%SE_TOOLS%\SeriousSkaStudio"
if exist "SeriousSkaStudio.exe" (
    start SeriousSkaStudio.exe
) else (
    echo SeriousSkaStudio.exe no encontrado. Compila primero el proyecto.
    pause
)
goto menu

:run_server
echo.
echo Ejecutando DedicatedServer...
cd /d "%SE_SOURCES%\DedicatedServer"
if exist "DedicatedServer.exe" (
    start DedicatedServer.exe
) else (
    echo DedicatedServer.exe no encontrado. Compila primero el proyecto.
    pause
)
goto menu

:show_docs
echo.
echo Abriendo documentacion...
start README.md
start BUILD_INSTRUCTIONS.md
start DEVELOPMENT_GUIDE.md
goto menu

:exit
echo.
echo Saliendo del entorno de desarrollo...
echo ¡Gracias por usar Serious Engine 1.50!
pause
exit /b 0