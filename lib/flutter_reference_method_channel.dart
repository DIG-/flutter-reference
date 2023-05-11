import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_reference_platform_interface.dart';

/// An implementation of [FlutterReferencePlatform] that uses method channels.
class MethodChannelFlutterReference extends FlutterReferencePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_reference');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
