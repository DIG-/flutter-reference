import 'package:flutter/services.dart';

import 'reference.dart';

/// Extension to reduce boilerplate to cast the return of [invokeMethod]
/// to [Reference]
extension ReferenceChannel on MethodChannel {
  /// Always return [T]
  ///
  /// Can throw an [Error]
  Future<T> invokeMethodReference<T extends Reference>(
          String method, T Function(String id) creator, [dynamic arguments]) =>
      invokeMethodReferenceNullable(method, creator, arguments)
          .then((value) => value!);

  /// Return *null* if [invokeMethod] return *null*. Otherwise return [T].
  Future<T?> invokeMethodReferenceNullable<T extends Reference>(
          String method, T Function(String id) creator, [dynamic arguments]) =>
      invokeMethod<String>(method, arguments)
          .then((value) => value == null ? null : creator(value));
}
