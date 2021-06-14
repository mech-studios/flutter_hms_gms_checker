import 'dart:async';

import 'package:flutter/services.dart';

class FlutterHmsGmsChecker {
  static const MethodChannel _channel =
      const MethodChannel('flutter_hms_gms_checker');

  static Future<bool> get isHmsAvailable async {
    return await _channel.invokeMethod('isHmsAvailable');
  }

  static Future<bool> get isGmsAvailable async {
    return await _channel.invokeMethod('isGmsAvailable');
  }
}
