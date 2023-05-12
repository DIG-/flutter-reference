Flutter Reference
=================
[![Pub](https://img.shields.io/pub/v/flutter_reference.svg)](https://pub.dev/packages/flutter_reference)
[![Pub Score](https://img.shields.io/pub/points/flutter_reference?color=2E8B57&label=pub%20points)](https://pub.dev/packages/flutter_reference/score)
[![License](https://img.shields.io/static/v1?label=license&message=CC%20BY-ND%204.0&color=blue)](https://creativecommons.org/licenses/by-nd/4.0/)

A simple Flutter plugin to keep object in memory on native code, while pass a string reference to Flutter code.

Usefull to interact with native objects without serializing its content.

Usage
=====
From native side, after creating a instance, return it's reference to Flutter using:
```kotlin
val instance = Orange()
val ref = References.add(instance)
```

To retrieve a instance on native side, use:
```kotlin
val instance = References.get<Orange>(ref)
```

On Flutter side, always wrap the reference string on `Reference` class, since this class has capability to handle garbage collection.
```dart
Future<Reference> create() {
  return channel.invokeMethod("create").then((value) => Reference(value))
}
```

Also you can create your own class who extends `Reference`
```dart
class Fruit extends Reference {
  Fruit(super.id);
}
```

License
=======
[CC BY-ND 4.0](https://creativecommons.org/licenses/by-nd/4.0/)
- You can use and re-dist freely.
- You can also modify, but only for yourself.
- You can use it as a part of your project, but without modifications in this project.