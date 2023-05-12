import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_reference/reference.dart';

class Fruit extends Reference {
  @protected
  Fruit(super.id);

  static Future<Fruit> create() {
    return _FruitChannel.create();
  }

  Future<String> name() {
    return _FruitChannel.name(this);
  }
}

class _FruitChannel {
  static const channel = MethodChannel("example_plugin");

  static Future<Fruit> create() {
    return channel.invokeMethod("create").then((value) => Fruit(value));
  }

  static Future<String> name(final Fruit fruit) {
    return channel
        .invokeMethod("name", fruit.id)
        .then((value) => value.toString());
  }
}