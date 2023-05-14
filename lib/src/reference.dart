import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// A class to retain a reference from native code, allowing communication
/// without serialization.
///
/// Requires [id] returned from native side.
class Reference {
  /// Automagically handle garbage collection on Dart side to apply effect on
  /// native side.
  static final _finalizer = Finalizer<String>((id) {
    _ReferenceChannel.dispose(id);
  });

  /// Reference ID generated on native side.
  final String id;

  /// Default constructor who subscribe in [Finalizer] to auto-handle GC.
  Reference(this.id) {
    _finalizer.attach(this, id, detach: this);
  }

  /// Manually call [Finalizer.detach] for this [Reference].
  @nonVirtual
  void dispose() {
    _finalizer.detach(this);
  }

  /// Return a string representation of current class type and reference [id].
  @override
  String toString() {
    return "$runtimeType(id=#$id)";
  }
}

class _ReferenceChannel {
  static const _channel = MethodChannel("flutter_reference");

  static Future<void> dispose(final String id) {
    return _channel.invokeMethod("dispose", id);
  }
}
