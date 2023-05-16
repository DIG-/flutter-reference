```dart
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_reference/flutter_reference.dart';

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
    return channel.invokeMethodReference("create", (id) => Fruit(id));
  }

  static Future<String> name(final Fruit fruit) {
    return channel
        .invokeMethod("name", fruit.id)
        .then((value) => value.toString());
  }
}
```