package com.example.interview_getx

import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry

class MyApplication : FlutterApplication(), PluginRegistry.PluginRegistrantCallback {
    override fun onCreate() {
        super.onCreate()
    }

    override fun registerWith(registry: PluginRegistry) {}
}