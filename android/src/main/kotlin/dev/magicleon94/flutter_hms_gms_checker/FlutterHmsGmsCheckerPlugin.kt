package dev.magicleon94.flutter_hms_gms_checker

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.content.Context
import com.huawei.hms.api.HuaweiApiAvailability
import com.google.android.gms.common.GoogleApiAvailability

/** FlutterHmsGmsCheckerPlugin */
class FlutterHmsGmsCheckerPlugin : FlutterPlugin, MethodCallHandler {


    private var context: Context? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        val channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_hms_gms_checker")
        context = flutterPluginBinding.applicationContext
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        // do nothing
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "isHmsAvailable" -> {
                result.success(isHmsAvailable())
            }
            "isGmsAvailable" -> {
                result.success(isGmsAvailable())
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    private fun isHmsAvailable(): Boolean {
        var isAvailable = false
        if (context != null) {
            val result = HuaweiApiAvailability.getInstance().isHuaweiMobileServicesAvailable(context)
            isAvailable = com.huawei.hms.api.ConnectionResult.SUCCESS == result
        }
        return isAvailable
    }

    private fun isGmsAvailable(): Boolean {
        var isAvailable = false
        if (context != null) {
            val result: Int = GoogleApiAvailability.getInstance().isGooglePlayServicesAvailable(context!!)
            isAvailable = com.google.android.gms.common.ConnectionResult.SUCCESS == result
        }
        return isAvailable
    }

}
