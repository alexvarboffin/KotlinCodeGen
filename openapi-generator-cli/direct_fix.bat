@echo off

REM Полная очистка всего и подготовка
rmdir /s /q tmp 2>nul
mkdir tmp 2>nul
del /q templates\kotlin\MyUtils.mustache 2>nul

REM 1. Правильное размещение шаблона
copy /y templates\kotlin\supportingFiles\MyUtils.mustache templates\kotlin\MyUtils.mustache >nul
if not exist "templates\kotlin\MyUtils.mustache" (
    echo ОШИБКА: Не удалось скопировать шаблон в правильное место
    exit /b 1
)

REM 2. Создание файла с правильным содержимым
echo {> config.json
echo   "supportingFiles": [>> config.json
echo     {>> config.json
echo       "templateFile": "MyUtils.mustache",>> config.json
echo       "destinationFilename": "src/main/kotlin/E/utils/MyUtils.kt">> config.json
echo     }>> config.json
echo   ]>> config.json
echo }>> config.json

REM 3. Запуск openapi-generator с правильными параметрами
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

REM 4. Создание директории, если генератор не создал
if not exist "tmp\src\main\kotlin\E\utils" (
    mkdir tmp\src\main\kotlin\E\utils
)

REM 5. Ручное создание файла, если автогенерация не сработала
if not exist "tmp\src\main\kotlin\E\utils\MyUtils.kt" (
    echo package E.utils> tmp\src\main\kotlin\E\utils\MyUtils.kt
    echo.>> tmp\src\main\kotlin\E\utils\MyUtils.kt
    echo object MyUtils {>> tmp\src\main\kotlin\E\utils\MyUtils.kt
    echo     fun hello(): String = "Hello, бро!">> tmp\src\main\kotlin\E\utils\MyUtils.kt
    echo }>> tmp\src\main\kotlin\E\utils\MyUtils.kt
    echo.>> tmp\src\main\kotlin\E\utils\MyUtils.kt
    echo ВНИМАНИЕ: Файл был создан вручную!
) else (
    echo УСПЕХ: Файл был создан через generator.
)

REM 6. Удаление временных файлов
del templates\kotlin\MyUtils.mustache

echo.
echo Процесс завершен. Проверь файл: tmp\src\main\kotlin\E\utils\MyUtils.kt 