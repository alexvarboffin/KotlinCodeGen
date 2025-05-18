@echo off
echo Generating code with OpenAPI Generator...

java -jar openapi-generator-cli-7.13.0.jar generate ^
  -i openapi.json ^
  -g kotlin ^
  -o tmp/ ^
  --template-dir templates/kotlin ^
  -t templates/kotlin ^
  --skip-validate-spec ^
  --additional-properties packageName=E ^
  --additional-properties verbose=true ^
  --additional-properties omitInfrastructureClasses=true ^
  --global-property supportingFiles=MyUtils.mustache ^
  --global-property apiTests=false,modelTests=false ^
  --additional-properties library=jvm-ktor,serializationLibrary=kotlinx_serialization,hideGenerationTimestamp=true ^
  --global-property debugSupportingFiles=true -c config.json
echo Generation completed!
pause

 --additional-properties artifactId=petstore-okhttp-gson,hideGenerationTimestamp=true