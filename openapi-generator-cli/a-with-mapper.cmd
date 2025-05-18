npx @openapitools/openapi-generator-cli generate -i openapi.json -g kotlin -o ./src/main/kotlin --skip-validate-spec --additional-properties=library=jvm-ktor,serializationLibrary=kotlinx_serialization --template-dir ./templates --template-engine-name=freemarker --template-files=model.ftl,mapper.ftl --file-post-processors=kotlin

pause