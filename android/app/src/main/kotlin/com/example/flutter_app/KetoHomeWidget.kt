package com.example.flutter_app

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.res.Configuration
import android.net.Uri
import android.util.AtomicFile
import android.view.View
import android.widget.RemoteViews
import org.json.JSONObject
import java.io.File
import java.text.DateFormat
import java.text.NumberFormat
import java.util.Date
import java.util.Locale
import java.util.TimeZone

class KetoHomeWidget : AppWidgetProvider() {
    override fun onUpdate(context: Context, manager: AppWidgetManager, ids: IntArray) {
        render(context, manager, ids)
    }

    companion object {
        fun publish(context: Context, snapshot: Map<*, *>?) {
            val file = storage(context)
            if (snapshot == null) {
                file.delete()
            } else {
                val json = JSONObject()
                for ((key, value) in snapshot) {
                    if (key is String && (value is String || value is Number)) {
                        json.put(key, value)
                    }
                }
                val output = file.startWrite()
                try {
                    output.write(json.toString().toByteArray(Charsets.UTF_8))
                    file.finishWrite(output)
                } catch (error: Exception) {
                    file.failWrite(output)
                    throw error
                }
            }
            val manager = AppWidgetManager.getInstance(context)
            val ids = manager.getAppWidgetIds(ComponentName(context, KetoHomeWidget::class.java))
            render(context, manager, ids)
        }

        private fun storage(context: Context): AtomicFile =
            AtomicFile(File(context.noBackupFilesDir, "keto_widget_summary.json"))

        private fun read(context: Context): JSONObject? = try {
            JSONObject(storage(context).readFully().toString(Charsets.UTF_8))
        } catch (_: Exception) {
            null
        }

        private fun open(context: Context, route: String, request: Int): PendingIntent {
            val intent = Intent(context, MainActivity::class.java)
                .setAction(Intent.ACTION_VIEW)
                .setData(Uri.parse("keto-tracker://widget/$route"))
                .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP or Intent.FLAG_ACTIVITY_SINGLE_TOP)
            return PendingIntent.getActivity(
                context, request, intent, PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
            )
        }

        private fun render(context: Context, manager: AppWidgetManager, ids: IntArray) {
            val saved = read(context)
            val locale = saved?.optString("language")?.takeIf { it == "ar" || it == "en" }
                ?.let(Locale::forLanguageTag) ?: context.resources.configuration.locales[0]
            val config = Configuration(context.resources.configuration).apply {
                setLocale(locale)
                setLayoutDirection(locale)
            }
            val localized = context.createConfigurationContext(config)
            val views = RemoteViews(context.packageName, R.layout.keto_home_widget)
            views.setTextViewText(R.id.widget_title, localized.getString(R.string.keto_widget_title))
            views.setOnClickPendingIntent(R.id.widget_root, open(context, "home", 1))
            views.setOnClickPendingIntent(R.id.widget_calories, open(context, "diary", 2))
            views.setOnClickPendingIntent(R.id.widget_water, open(context, "wellness", 3))
            views.setOnClickPendingIntent(R.id.widget_fast, open(context, "wellness", 3))
            views.setOnClickPendingIntent(R.id.widget_weight, open(context, "progress", 4))

            val expired = saved != null && saved.optLong("expiresAt") <= System.currentTimeMillis()
            if (saved == null || expired) {
                views.setViewVisibility(R.id.widget_metrics, View.GONE)
                views.setTextViewText(
                    R.id.widget_status,
                    localized.getString(if (expired) R.string.keto_widget_expired else R.string.keto_widget_hidden),
                )
                for (id in listOf(R.id.widget_calories, R.id.widget_water, R.id.widget_fast, R.id.widget_weight)) {
                    views.setTextViewText(id, "")
                }
            } else {
                views.setViewVisibility(R.id.widget_metrics, View.VISIBLE)
                val number = NumberFormat.getNumberInstance(locale).apply { maximumFractionDigits = 1 }
                val unknown = localized.getString(R.string.keto_widget_unknown)
                fun amount(key: String): String =
                    saved.optDouble(key).takeIf { it.isFinite() }?.let { number.format(it) } ?: unknown
                val status = when (saved.optString("status")) {
                    "pending" -> R.string.keto_widget_pending
                    "synced" -> R.string.keto_widget_synced
                    else -> R.string.keto_widget_cached
                }
                val fastEnd = saved.optLong("fastEnd").takeIf { it > 0 }?.let { end ->
                    DateFormat.getTimeInstance(DateFormat.SHORT, locale).apply {
                        timeZone = TimeZone.getTimeZone(saved.optString("timezone", "UTC"))
                    }.format(Date(end))
                } ?: unknown
                views.setTextViewText(R.id.widget_status, localized.getString(status))
                views.setTextViewText(R.id.widget_calories, localized.getString(
                    R.string.keto_widget_calories, amount("confirmedKcal"), amount("pendingKcal"),
                ))
                views.setTextViewText(R.id.widget_water, localized.getString(R.string.keto_widget_water, amount("waterMl")))
                views.setTextViewText(R.id.widget_fast, localized.getString(R.string.keto_widget_fast, fastEnd))
                views.setTextViewText(R.id.widget_weight, localized.getString(R.string.keto_widget_weight, amount("weightKg")))
            }
            for (id in ids) manager.updateAppWidget(id, views)
        }
    }
}
