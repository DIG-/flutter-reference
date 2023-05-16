import 'package:flutter/foundation.dart';

import '../flutter_reference_platform_interface.dart';

/// A class to retain a reference from native code, allowing communication
/// without serialization.
///
/// Requires [id] returned from native side.
class Reference {
  /// Automagically handle garbage collection on Dart side to apply effect on
  /// native side.
  static final _finalizer = Finalizer<String>((id) {
    FlutterReferencePlatform.instance.disposeById(id);
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

  /// The hash code for this object.
  @override
  int get hashCode => id.hashCode;

  /// The equality operator.
  @override
  bool operator ==(Object other) {
    if (other is! Reference) {
      return false;
    }
    return other.id == id;
  }
}
