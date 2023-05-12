import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reference_example/fruit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _fruit = "Wait";

  @override
  void initState() {
    super.initState();
    _loadFruit();
  }

  void _loadFruit() async {
    final fruit = await Fruit.create();
    if (kDebugMode) {
      print(fruit);
    }
    final name = await fruit.name();
    setState(() {
      _fruit = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text("Fruit: $_fruit"),
        ),
      ),
    );
  }
}
