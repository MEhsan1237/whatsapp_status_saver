pluginManagement {
    val flutterSdkPath =
        run {
            val properties = java.util.Properties()
            file("local.properties").inputStream().use { properties.load(it) }
            val flutterSdkPath = properties.getProperty("flutter.sdk")
            require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
            flutterSdkPath
        }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.9.1" apply false
    id("org.jetbrains.kotlin.android") version "2.1.0" apply false
}

// ✅ Automatically fix missing namespace in certain Flutter plugins
gradle.beforeProject {
    val fixList = listOf(
        "flutter_native_api" to "com.example.flutter_native_api",
        "image_gallery_saver" to "com.example.image_gallery_saver"
    )

    fixList.forEach { (pluginName, ns) ->
        if (name == pluginName) {
            val buildFile = projectDir.resolve("build.gradle")
            if (buildFile.exists()) {
                val content = buildFile.readText()
                if (!content.contains("namespace")) {
                    val newContent = content.replaceFirst(
                        "android {",
                        "android {\n    namespace '$ns'"
                    )
                    buildFile.writeText(newContent)
                    println("✅ Namespace '$ns' added automatically for plugin: $pluginName")
                }
            }
        }
    }
}

include(":app")
