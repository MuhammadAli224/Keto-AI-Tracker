package com.example.flutter_app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "keto_tracker/home_widget")
            .setMethodCallHandler { call, result ->
                try {
                    when (call.method) {
                        "publish" -> {
                            KetoHomeWidget.publish(applicationContext, call.arguments as Map<*, *>)
                            result.success(null)
                        }
                        "hide" -> {
                            KetoHomeWidget.publish(applicationContext, null)
                            result.success(null)
                        }
                        else -> result.notImplemented()
                    }
                } catch (_: Exception) {
                    result.error("widget_update_failed", "Unable to refresh widget", null)
                }
            }
    }
}
