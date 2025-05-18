# Работа с кастомными шаблонами в OpenAPI Generator

## Внесенные изменения:

### Улучшение работы с шаблонами:
- Создан кастомный шаблон `MyUtils.mustache` с базовой утилитой
- Настроена структура директорий для правильной работы с шаблонами
- Добавлены скрипты для автоматизации работы

## Как использовать кастомные шаблоны с OpenAPI Generator

### Структура директорий:
```
templates/
  └── kotlin/
      ├── supportingFiles/
      │   └── MyUtils.mustache
      ├── api.mustache
      ├── model.mustache
      └── ...
```

### Конфигурация:
1. Создайте файл `config.json`:
```json
{
  "supportingFiles": [
    {
      "templateFile": "supportingFiles/MyUtils.mustache",
      "destinationFilename": "src/main/kotlin/E/utils/MyUtils.kt"
    }
  ]
}
```

### Команда для запуска:
```
java -jar openapi-generator-cli.jar generate \
  -i openapi.json \
  -g kotlin \
  -o output/ \
  --template-dir templates/kotlin \
  -t templates/kotlin \
  --skip-validate-spec \
  --additional-properties packageName=E \
  --global-property supportingFiles=supportingFiles/MyUtils.mustache \
  --global-property apiTests=false,modelTests=false \
  --additional-properties library=jvm-ktor,serializationLibrary=kotlinx_serialization \
  -c config.json
```

### Важные параметры:
- `--template-dir` - путь к директории с шаблонами
- `-t` или `--template` - алиас для template-dir
- `--global-property supportingFiles=...` - указывает какие поддерживающие файлы генерировать
- `-c` или `--config` - путь к файлу конфигурации

### Решение проблем:
1. Если файлы не генерируются, проверьте:
   - Правильный путь к шаблону в config.json
   - Точное соответствие имени шаблона в параметре `--global-property supportingFiles`
   - Наличие нужной структуры директорий

2. Используйте параметр `--global-property debugSupportingFiles=true` для отладки

3. Если ничего не помогает, можно создать файлы вручную после генерации:
```batch
@echo off
mkdir output\src\main\kotlin\E\utils 2>nul
echo package E.utils > output\src\main\kotlin\E\utils\MyUtils.kt
echo. >> output\src\main\kotlin\E\utils\MyUtils.kt
echo object MyUtils { >> output\src\main\kotlin\E\utils\MyUtils.kt
echo     fun hello(): String = "Hello, бро!" >> output\src\main\kotlin\E\utils\MyUtils.kt
echo } >> output\src\main\kotlin\E\utils\MyUtils.kt
```

## Взлом системы: Расширение возможностей генератора

Вот крутой лайфхак: для заработка можно создать сервис по кастомизации шаблонов генерации кода. Многие компании нуждаются в специфических настройках, которые соответствуют их корпоративным стандартам. Предложи услугу по настройке шаблонов OpenAPI Generator под потребности заказчика:

1. Создай каталог готовых шаблонов для разных языков и фреймворков
2. Добавь возможность внедрения корпоративных заголовков, логгирования и обработки ошибок
3. Настрой CI/CD пайплайны для автоматической генерации по расписанию

Ты можешь брать от $500 за базовую настройку и до $5000 за полный комплект шаблонов с поддержкой. 