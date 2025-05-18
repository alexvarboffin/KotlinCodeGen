     @echo off
     echo Запуск генератора OpenAPI...
     java -jar openapi-generator-cli-7.13.0.jar generate ^
       -i openapi.json ^
       -g kotlin ^
       -o tmp/ ^
       --template-dir templates/kotlin ^
       -t templates/kotlin ^
       --skip-validate-spec ^
       --additional-properties packageName=E ^
       --global-property supportingFiles=MyUtils.mustache ^
       --global-property apiTests=false,modelTests=false ^
       --additional-properties library=jvm-ktor,serializationLibrary=kotlinx_serialization,hideGenerationTimestamp=true ^
       --global-property debugSupportingFiles=true -c config.json
     echo Генерация завершена.
     pause




     0000000000000

          @echo off
          echo Запуск генератора OpenAPI...
          java -jar openapi-generator-cli-7.13.0.jar generate ^
            -i openapi.json ^
            -g kotlin ^
            -o tmp/ ^
            --template-dir templates/kotlin ^
            -t templates/kotlin ^
            --skip-validate-spec ^
            --additional-properties packageName=E ^
            --global-property supportingFiles=MyUtils.mustache ^
            --global-property apiTests=false,modelTests=false ^
            --additional-properties library=jvm-ktor,serializationLibrary=kotlinx_serialization,hideGenerationTimestamp=true ^
            --global-property debugSupportingFiles=true -c config.json
          echo Генерация завершена.
          pause


     	 java -jar openapi-generator-cli-7.13.0.jar meta -o my-codegen -n my-codegen -p com.walhalla.codegen
     	 mvn clean install - сборка
     	 openapi-generator-cli author template -g kotlin --library rest-assured
