import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_auto_detector_platform_interface.dart';

/// An implementation of [AndroidAutoDetectorPlatform] that uses method channels.
class MethodChannelAndroidAutoDetector extends AndroidAutoDetectorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final channel = const EventChannel('AndroidAutoDetectorPlugin');

  @override
  Stream<bool> isConnected() {
    return channel.receiveBroadcastStream().cast();
  }
}
