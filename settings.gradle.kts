plugins {
    id("org.gradle.toolchains.foojay-resolver-convention") version "0.8.0"
}
rootProject.name = "KotlinCodeGen"

include("my-codegen")
project(":my-codegen").projectDir = file("openapi-generator-cli/my-codegen")

