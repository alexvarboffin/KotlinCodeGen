plugins {
    `java-library`
}

group = "org.openapitools"
version = "1.0.0"

repositories {
    mavenCentral()
}

dependencies {
    compileOnly("org.openapitools:openapi-generator:7.13.0")
    testImplementation("org.openapitools:openapi-generator:7.13.0")
    testImplementation("org.junit.jupiter:junit-jupiter-api:5.10.2")
    testRuntimeOnly("org.junit.jupiter:junit-jupiter-engine:5.10.2")
}

tasks.test {
    useJUnitPlatform()
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(17))
    }
}
