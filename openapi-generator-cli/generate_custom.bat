@echo off
REM Создание директорий, если не существуют
mkdir tmp 2>nul

REM Запуск openapi-generator
java -jar openapi-generator-cli-7.13.0.jar generate ^
  -i openapi.json ^
  -g kotlin ^
  -o tmp/ ^
  --template-dir templates/kotlin ^
  -t templates/kotlin ^
  --skip-validate-spec ^
  --additional-properties packageName=E ^
  --global-property supportingFiles=supportingFiles/MyUtils.mustache ^
  --global-property apiTests=false,modelTests=false ^
  --additional-properties library=jvm-ktor,serializationLibrary=kotlinx_serialization,hideGenerationTimestamp=true ^
  --global-property debugSupportingFiles=true -c config.json

REM Если директория utils не создалась автоматически, создаем ее вручную
IF NOT EXIST tmp\src\main\kotlin\E\utils (
  mkdir tmp\src\main\kotlin\E\utils
)


echo Генерация завершена. Проверь файлы в директории tmp\src\main\kotlin\E\utils 