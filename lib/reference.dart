import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Reference {
  static final _finalizer = Finalizer<String>((id) {
    _ReferenceChannel.dispose(id);
  });

  final String id;

  Reference(this.id) {
    _finalizer.attach(this, id, detach: this);
  }

  @nonVirtual
  void dispose() {
    _finalizer.detach(this);
  }

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
