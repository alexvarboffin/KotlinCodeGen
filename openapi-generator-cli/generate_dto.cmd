@echo off
REM === Скрипт генерации DTO и мапперов из OpenAPI для Kotlin Multiplatform ===
REM Автор: DAN

REM === Параметры ===
set OPENAPI_FILE=openapi.json
set OUTPUT_DIR=generated
set GENERATOR_NAME=kotlin
set PACKAGE_NAME=com.example.generated

REM === Проверка наличия OpenAPI-файла ===
if not exist "%OPENAPI_FILE%" (
    echo Не найден файл %OPENAPI_FILE% в корне проекта!
    exit /b 1
)

REM === Генерация ===
openapi-generator-cli generate ^
    -i "%OPENAPI_FILE%" ^
    -g %GENERATOR_NAME% ^
    -o %OUTPUT_DIR% ^
    --package-name %PACKAGE_NAME% ^
    --additional-properties=serializationLibrary=kotlinx_serialization ^
    --skip-validate-spec ^
    -t templates ^
    --global-property models,supportingFiles

REM === Готово ===
echo Генерация завершена! Проверь папку %OUTPUT_DIR% 