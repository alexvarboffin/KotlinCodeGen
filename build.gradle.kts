plugins {
    kotlin("jvm") version "2.0.21"
    id("org.openapi.generator") version "7.13.0"
}

group = "org.example"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    testImplementation(kotlin("test"))
}

tasks.test {
    useJUnitPlatform()
}
kotlin {
    jvmToolchain(17)
}
openApiGenerate {
    generatorName.set("kotlin")
    packageName.set("us.jimschubert.example")

    inputSpec.set("$rootDir/spec/openapi.json")
    outputDir.set("$buildDir/generated")
    apiPackage.set("org.walhalla.api")
    invokerPackage.set("org.walhalla.invoker")
    modelPackage.set("com.walhalla.model")
//    configOptions.put("dateLibrary", "@@@@@@@@@@@")//java8

    skipValidateSpec = true

// other settings omitted
//    globalProperties.put("models", "User:Pet")

    additionalProperties.put("library", "jvm-ktor")
    additionalProperties.put("serializationLibrary", "kotlinx_serialization")
    additionalProperties.put("hideGenerationTimestamp", true)
    additionalProperties.put("verbose", "true")
    additionalProperties.put("packageName", "fffff.ttt.uuuu")

    additionalProperties.put("omitInfrastructureClasses", "false")
    additionalProperties.put("omitApiClasses", "false")


//    globalProperties.put("modelTests", "false")
//    globalProperties.put("apiTests", "false")

    globalProperties.set(
        mutableMapOf(
            "modelTests" to "false",
            "apiTests" to "false",
            "models" to "Comment:Pet"//<--------------------------
        )
    )
//x-field-extraanotation
    //ignoreFileOverride.set("$rootDir/.openapi-generator-ignore")
    generateApiTests.set(false)
//    //println(version)
//
//    configOptions.set(
//        mutableMapOf(
//            "dateLibrary" to "java8",
//            "enumPropertyNaming" to "UPPERCASE"
//        )
//    )
//    //generateConstructorWithAllArgs="false"
//
//    importMappings.set(
//        mutableMapOf(
//            "Comment" to "org.walhalla.model.Comment",
//            "Login" to "org.walhalla.model.L1",
//
//
//            "Pet" to "org.walhalla.model.Pet"
//        )
//    )
}
tasks.compileKotlin {
    dependsOn(tasks.named("openApiGenerate"))
}
//sourceSets{
//    main {
//        java {
//            srcDir("$buildDir/generated/src/main/kotlin")
//        }
//    }
//}