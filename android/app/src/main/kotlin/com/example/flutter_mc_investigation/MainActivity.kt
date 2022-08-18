package com.example.flutter_mc_investigation

import io.flutter.embedding.android.FlutterActivity
import android.util.Log;
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "sample.method.channel"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {

        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        super.configureFlutterEngine(flutterEngine)
        channel.setMethodCallHandler {
            call, result ->
                Log.d("android", "${call.arguments}");
                channel.invokeMethod("callBack", "data1")
        }

        
    }
}
