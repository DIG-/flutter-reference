import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_reference_method_channel.dart';

abstract class FlutterReferencePlatform extends PlatformInterface {
  /// Constructs a FlutterReferencePlatform.
  FlutterReferencePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterReferencePlatform _instance = MethodChannelFlutterReference();

  /// The default instance of [FlutterReferencePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterReference].
  static FlutterReferencePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterReferencePlatform] when
  /// they register themselves.
  static set instance(FlutterReferencePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
