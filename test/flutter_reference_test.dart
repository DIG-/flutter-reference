import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_reference/flutter_reference.dart';
import 'package:flutter_reference/flutter_reference_platform_interface.dart';
import 'package:flutter_reference/flutter_reference_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterReferencePlatform
    with MockPlatformInterfaceMixin
    implements FlutterReferencePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterReferencePlatform initialPlatform = FlutterReferencePlatform.instance;

  test('$MethodChannelFlutterReference is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterReference>());
  });

  test('getPlatformVersion', () async {
    FlutterReference flutterReferencePlugin = FlutterReference();
    MockFlutterReferencePlatform fakePlatform = MockFlutterReferencePlatform();
    FlutterReferencePlatform.instance = fakePlatform;

    expect(await flutterReferencePlugin.getPlatformVersion(), '42');
  });
}
