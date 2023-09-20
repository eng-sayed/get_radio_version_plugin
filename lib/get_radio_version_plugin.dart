
import 'dart:async';

import 'package:flutter/services.dart';

class GetRadioVersionPlugin {
  static const MethodChannel _channel = MethodChannel('get_radio_version_plugin');

  static Future<String?> get radioVersion async {
    final String? version = await _channel.invokeMethod('getRadioVersion');
    return version;
  }
}
