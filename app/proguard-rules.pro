# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in C:\Users\***\AppData\Local\Android\Sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

-keepattributes LineNumberTable

# 架构基础类
-keep class com.qihoo360.replugin.RePlugin {
    public protected *;
}
# LocalBroadcastManager，插件会用
-keep public class android.support.v4.content.LocalBroadcastManager {
    public *;
}

# 架构具体实现，和插件反射调用部分
-keep class com.qihoo360.replugin.model.PluginInfo {
    public protected *;
}
-keep class com.qihoo360.replugin.IBinderGetter {
     public protected *;
}
-keep class com.qihoo360.replugin.component.ComponentList {
    public protected *;
}
-keep class com.qihoo360.framework.** {
    public protected *;
}
-keep class com.qihoo360.i.** {
    public protected *;
}
-keep class com.qihoo360.plugins.** {
    public protected *;
}
-keep class com.qihoo360.plugin.** {
    public protected *;
}
-keep class com.qihoo360.replugin.component.dummy.** {
    public protected *;
}
-keep class com.qihoo360.replugin.component.provider.PluginProviderClient {
    public protected *;
}
-keep class com.qihoo360.replugin.component.provider.PluginProviderClient2 {
    public protected *;
}
-keep class com.qihoo360.replugin.component.service.PluginServiceClient {
    public protected *;
}
-keep class com.qihoo360.replugin.component.provider.PluginPitProviderP0 { public protected *; }
-keep class com.qihoo360.replugin.component.provider.PluginPitProviderP1 { public protected *; }
-keep class com.qihoo360.replugin.component.provider.PluginPitProviderP2 { public protected *; }

# ProcessPitProviderP0 未被自动 keep
-keep class com.qihoo360.replugin.component.process.ProcessPitProviderP0 { public protected *; }
-keep class com.qihoo360.replugin.component.process.ProcessPitProviderP1 { public protected *; }
-keep class com.qihoo360.replugin.component.process.ProcessPitProviderP2 { public protected *; }

# TODO 可能要废弃的类。目前旧卫士插件在用
# Pref
-keep public class com.qihoo360.mobilesafe.api.Pref {
    public *;
}
# IPC
-keep public class com.qihoo360.mobilesafe.api.IPC {
    public *;
}
# QihooServiceManager
-keep public class com.qihoo360.mobilesafe.svcmanager.QihooServiceManager {
    public *;
}
# Old PPC/PSC
-keep class com.qihoo360.loader2.mgr.PluginProviderClient {
    public protected *;
}
-keep class com.qihoo360.loader2.mgr.PluginServiceClient {
    public protected *;
}

# ------------ keep 以下类，以防卫士主程序 AOP DEBUG 失败 ------------
-keep class com.qihoo360.replugin.component.activity.ActivityInjector { *;}

# replugin-host-gradle 生成的 java 文件
-keep class com.qihoo360.replugin.gen.RePluginHostConfig { public *; }

