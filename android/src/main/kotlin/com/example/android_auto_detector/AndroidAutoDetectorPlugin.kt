package com.example.android_auto_detector

import androidx.car.app.connection.CarConnection
import androidx.lifecycle.LiveData
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel

/** AndroidAutoDetectorPlugin */
class AndroidAutoDetectorPlugin: FlutterPlugin, EventChannel.StreamHandler {
  private lateinit var type: LiveData<Int>
  private var sink: EventChannel.EventSink? = null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    type = CarConnection(flutterPluginBinding.applicationContext).type
    val channel = EventChannel(flutterPluginBinding.binaryMessenger, "AndroidAutoDetectorPlugin")
    channel.setStreamHandler(this)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {}

  override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
    sink = events
    type.observeForever(::observe)

  }

  private fun observe(value: Int) {
    sink?.success(value != CarConnection.CONNECTION_TYPE_NOT_CONNECTED)
  }

  override fun onCancel(arguments: Any?) {
    type.removeObserver(::observe)
  }
}


