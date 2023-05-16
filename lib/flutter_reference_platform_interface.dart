import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'src/platform.dart';
import 'src/reference.dart';

/// The interface that implementations of flutter_reference must implement.
abstract class FlutterReferencePlatform extends PlatformInterface {
  /// Constructs a FlutterReferencePlatform.
  FlutterReferencePlatform() : super(token: _token);
  static final Object _token = Object();

  static FlutterReferencePlatform _instance = Platform();

  /// The default instance of [FlutterReferencePlatform] to use.
  ///
  /// Defaults to [Platform].
  static FlutterReferencePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterReferencePlatform] when
  /// they register themselves.
  static set instance(final FlutterReferencePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Dispose reference from native side.
  ///
  /// Avoid calling this manually. Let [Reference] handle it with [Finalizer].
  Future<bool> dispose(final Reference reference) => disposeById(reference.id);

  /// Dispose reference from native side.
  ///
  /// Avoid calling this manually. Let [Reference] handle it with [Finalizer].
  Future<bool> disposeById(final String id) => throw UnimplementedError();
}
