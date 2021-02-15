
import 'dart:async';

import 'package:flutter/services.dart';

class JavaneseDateConverter {
  static const MethodChannel _channel =
      const MethodChannel('javanese_date_converter');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
