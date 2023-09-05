import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_auto_detector_method_channel.dart';

abstract class AndroidAutoDetectorPlatform extends PlatformInterface {
  /// Constructs a AndroidAutoDetectorPlatform.
  AndroidAutoDetectorPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidAutoDetectorPlatform _instance = MethodChannelAndroidAutoDetector();

  /// The default instance of [AndroidAutoDetectorPlatform] to use.
  ///
  /// Defaults to [MethodChannelAndroidAutoDetector].
  static AndroidAutoDetectorPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndroidAutoDetectorPlatform] when
  /// they register themselves.
  static set instance(AndroidAutoDetectorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Stream<bool> isConnected() => Stream.value(false);
}
