import java.util.Properties
import java.io.FileInputStream

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

plugins {
    id("com.android.application")
    // Flutter Gradle Plugin 必须在 Android 与 Kotlin Gradle 插件之后应用。
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.chimo.app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        // TODO: 指定你自己的唯一 Application ID（https://developer.android.com/studio/build/application-id.html）。
        applicationId = "com.chimo.app"
        // 可按应用需要调整下列取值。
        // 更多信息见：https://flutter.dev/to/review-gradle-config。
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String?
            keyPassword = keystoreProperties["keyPassword"] as String?
            storeFile = keystoreProperties["storeFile"]?.let { file(it) }
            storePassword = keystoreProperties["storePassword"] as String?
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro",
            )
        }
    }

    packaging {
        pickFirst("lib/*/libEncryptorP.so")
        pickFirst("lib/arm64-v8a/libliteavsdk.so")
        pickFirst("lib/armeabi-v7a/libliteavsdk.so")
        pickFirst("lib/arm64-v8a/libaosl.so")
        pickFirst("lib/armeabi-v7a/libaosl.so")

        jniLibs {
            useLegacyPackaging = true
        }
        // 👇 --------- 新增这两行，暴力强制剔除模拟器架构 --------- 👇
        exclude("lib/x86/**")
        exclude("lib/x86_64/**")

        //删除没有用到的声网相关的so库:https://docs.agora.io/cn/video-call-4.x/faq/reduce_app_size_ng
        val deleteSoNames = listOf(
            "libagora_audio_beauty_extension.so",
            "libagora_spatial_audio_extension.so",
            "libagora_ci_extension.so",
            "libagora_segmentation_extension.so",
            "libagora_super_resolution_extension.so",
            "libagora_ai_noise_suppression_extension.so",
            "libagora_content_inspect_extension.so",
            "libagora_clear_vision_extension.so",
            "libagora_screen_capture_extension.so",
            "libagora_pvc_extension.so"
        )
        for (name in deleteSoNames) {
            exclude("lib/arm64-v8a/$name")
            exclude("lib/armeabi-v7a/$name")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}
