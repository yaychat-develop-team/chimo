allprojects {
    repositories {
        maven(url = "https://maven.aliyun.com/repository/google")
        maven(url = "https://maven.aliyun.com/repository/public")
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
// tencent_rtc_sdk 12.3.2 把 compileSdk 写死成 31，其 AndroidX 依赖要求至少 34，
// checkAarMetadata 会因此失败。库模块低于 :app 时抬到与应用相同。
// afterEvaluate 必须写在 evaluationDependsOn 之前，否则 :app 已被求值，回调注册会失败。
subprojects {
    if (!state.executed) {
        afterEvaluate {
            val androidExt = extensions.findByType(com.android.build.gradle.BaseExtension::class.java)
                ?: return@afterEvaluate
            val current = androidExt.compileSdkVersion
                ?.removePrefix("android-")
                ?.toIntOrNull()
                ?: return@afterEvaluate
            val appSdk = rootProject.project(":app").extensions
                .findByType(com.android.build.gradle.BaseExtension::class.java)
                ?.compileSdkVersion
                ?.removePrefix("android-")
                ?.toIntOrNull()
                ?: return@afterEvaluate
            if (current < appSdk) {
                androidExt.compileSdkVersion(appSdk)
            }
        }
    }
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
