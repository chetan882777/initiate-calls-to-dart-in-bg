import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:initiate_calls_to_dart_in_bg/initiate_calls_to_dart_in_bg.dart';

void main() {
  const MethodChannel channel = MethodChannel('initiate_calls_to_dart_in_bg');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await InitiateCallsToDartInBg.platformVersion, '42');
  });
}
