import 'package:flutter/services.dart';

import '../flutter_reference_platform_interface.dart';

/// Default implementation of [FlutterReferencePlatform]
class Platform extends FlutterReferencePlatform {
  final _channel = const MethodChannel("flutter_reference");

  @override
  Future<bool> disposeById(final String id) => _channel
      .invokeMethod<bool>("dispose", id)
      .then((value) => value ?? false);
}
