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
    id("com.android.application") version "8.11.1" apply false
    id("org.jetbrains.kotlin.android") version "2.2.20" apply false
}

include(":app")
include(":flutter_plugin_android_lifecycle")
project(":flutter_plugin_android_lifecycle").projectDir = file("../.pub-cache/hosted/pub.dev/flutter_plugin_android_lifecycle-2.0.33/android")
include(":path_provider_android")
project(":path_provider_android").projectDir = file("../.pub-cache/hosted/pub.dev/path_provider_android-2.2.22/android")
include(":url_launcher_android")
project(":url_launcher_android").projectDir = file("../.pub-cache/hosted/pub.dev/url_launcher_android-6.3.28/android")
