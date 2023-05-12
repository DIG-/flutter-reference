import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Reference {
  static final _finalizer = Finalizer<String>((id) {
    _ReferenceChannel.dispose(id);
  });

  final String _id;

  Reference(this._id) {
    _finalizer.attach(this, _id, detach: this);
  }

  @nonVirtual
  void dispose() {
    _finalizer.detach(this);
  }
}

class _ReferenceChannel {
  static const _channel = MethodChannel("flutter_reference");

  static Future<void> dispose(String id) {
    return _channel.invokeMethod("dispose", id);
  }
}
