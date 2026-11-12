package com.example.flutter_app

import android.app.Activity
import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

class MainActivity : FlutterActivity() {
    private var pendingExport: Pair<ByteArray, MethodChannel.Result>? = null

    companion object {
        private const val exportRequest = 2406
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "keto_tracker/photos")
            .setMethodCallHandler { call, result ->
                if (call.method == "privateDirectory") {
                    result.success(File(noBackupFilesDir, "meal_photos").absolutePath)
                } else {
                    result.notImplemented()
                }
            }
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "keto_tracker/export")
            .setMethodCallHandler { call, result ->
                when {
                    call.method != "save" -> result.notImplemented()
                    pendingExport != null -> result.error("export_busy", null, null)
                    call.arguments !is ByteArray -> result.error("export_invalid", null, null)
                    else -> {
                        pendingExport = Pair(call.arguments as ByteArray, result)
                        try {
                            val intent = Intent(Intent.ACTION_CREATE_DOCUMENT).apply {
                                addCategory(Intent.CATEGORY_OPENABLE)
                                type = "application/json"
                                putExtra(Intent.EXTRA_TITLE, "keto-tracker-export.json")
                                putExtra(Intent.EXTRA_LOCAL_ONLY, true)
                            }
                            startActivityForResult(intent, exportRequest)
                        } catch (_: Exception) {
                            pendingExport = null
                            result.error("export_failed", null, null)
                        }
                    }
                }
            }
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

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode != exportRequest) return
        val (bytes, result) = pendingExport ?: return
        val destination = data?.data
        if (resultCode != Activity.RESULT_OK || destination == null) {
            pendingExport = null
            result.success(false)
            return
        }
        Thread {
            val saved = try {
                val stream = contentResolver.openOutputStream(destination, "w")
                stream != null && stream.use {
                    it.write(bytes)
                    true
                }
            } catch (_: Exception) {
                false
            }
            runOnUiThread {
                pendingExport = null
                if (saved) result.success(true) else result.error("export_failed", null, null)
            }
        }.start()
    }
}
