@echo off
SETLOCAL

REM Путь к Java 17 (необходима для openapi-generator 7.x)
set JAVA_EXE="C:\Program Files\Java\jdk-17\bin\java.exe"

REM Пути к JAR файлам
set GEN_JAR=openapi-generator-cli\openapi-generator-cli-7.13.0.jar
set CUSTOM_JAR=openapi-generator-cli\my-codegen\build\libs\my-codegen-1.0.0.jar

REM Настройки спецификации и вывода
set SPEC=openapi-generator-cli\Example\openapi.json
set OUT=generated_custom
set PACKAGE=a.a.a

echo === Step 1: Rebuilding custom generator ===
call gradlew.bat :my-codegen:build -x test

if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Build failed!
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo === Step 2: Generating code ===
%JAVA_EXE% -cp "%GEN_JAR%;%CUSTOM_JAR%" ^
  org.openapitools.codegen.OpenAPIGenerator generate ^
  -i "%SPEC%" ^
  -g my-codegen ^
  -o "%OUT%" ^
  --global-property apis,models,supportingFiles,infrastructure ^
  --global-property packageName=ru.lds.online.v1 ^
  --additional-properties "library=jvm-ktor,serializationLibrary=kotlinx_serialization,useSealedClasses=true,oneOfInterfaces=true,packageName=%PACKAGE%" ^
  --skip-validate-spec

if %ERRORLEVEL% EQU 0 (
    echo.
    echo [SUCCESS] Generation complete! Check folder: %OUT%
) else (
    echo.
    echo [ERROR] Generation failed!
)

pause
