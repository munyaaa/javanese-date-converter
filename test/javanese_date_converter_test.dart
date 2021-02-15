import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:javanese_date_converter/javanese_date_converter.dart';

void main() {
  const MethodChannel channel = MethodChannel('javanese_date_converter');

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
    expect(await JavaneseDateConverter.platformVersion, '42');
  });
}
