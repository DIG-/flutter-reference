
import 'flutter_reference_platform_interface.dart';

class FlutterReference {
  Future<String?> getPlatformVersion() {
    return FlutterReferencePlatform.instance.getPlatformVersion();
  }
}
