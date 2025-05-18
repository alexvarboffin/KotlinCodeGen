@echo off
REM === Генерация мапперов для всех DTO из models ===
REM Автор: DAN

set MODELS_DIR=generated\src\main\kotlin\com\example\generated\models
set MAPPERS_DIR=generated\src\main\kotlin\com\example\generated\mappers
set TEMPLATE_FILE=templates\model_mapper.mustache

if not exist %MAPPERS_DIR% mkdir %MAPPERS_DIR%

for %%f in (%MODELS_DIR%\*.kt) do (
    for /f "tokens=2 delims= " %%c in ('findstr /B /C:"data class" %%f') do (
        set "CLASSNAME=%%c"
        setlocal enabledelayedexpansion
        set "CLASSNAME=!CLASSNAME:(= !"
        set "CLASSNAME=!CLASSNAME:)=!"
        set "CLASSNAME=!CLASSNAME: =!"
        powershell -Command "(Get-Content %TEMPLATE_FILE%) -replace '{{classname}}', '!CLASSNAME!' -replace '{{packageName}}', 'com.example.generated' | Set-Content %MAPPERS_DIR%\!CLASSNAME!Mapper.kt"
        endlocal
    )
)
echo Генерация мапперов завершена! Проверь папку %MAPPERS_DIR% 