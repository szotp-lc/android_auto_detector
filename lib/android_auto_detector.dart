import 'android_auto_detector_platform_interface.dart';

class AndroidAutoDetector {
  Stream<bool> isConnected() {
    return AndroidAutoDetectorPlatform.instance.isConnected();
  }
}
