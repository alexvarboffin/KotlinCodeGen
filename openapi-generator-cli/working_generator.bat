@echo off

REM Очистим директорию перед генерацией
rmdir /s /q tmp 2>nul
mkdir tmp 2>nul

REM Копируем шаблон на корневой уровень для совместимости
copy templates\kotlin\supportingFiles\MyUtils.mustache templates\kotlin\MyUtils.mustache /Y >nul

REM Запуск openapi-generator с правильными параметрами
java -jar openapi-generator-cli-7.13.0.jar generate ^
  -i openapi.json ^
  -g kotlin ^
  -o tmp/ ^
  --template-dir templates/kotlin ^
  --skip-validate-spec ^
  --additional-properties packageName=E ^
  --global-property supportingFiles=MyUtils.mustache ^
  --global-property apiTests=false,modelTests=false ^
  --additional-properties library=jvm-ktor,serializationLibrary=kotlinx_serialization,hideGenerationTimestamp=true ^
  --global-property debugSupportingFiles=true -c config.json

REM Удаляем временный файл
del templates\kotlin\MyUtils.mustache

echo.
echo Проверь наличие файла: tmp\src\main\kotlin\E\utils\MyUtils.kt
echo. 