import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

class AppMapStyle {
  static String? _mapStyleInstance;

  static Future<String> getMapStyleInstance() async {
    _mapStyleInstance ??=
        await rootBundle.loadString('lib/resources/map/map-style.json');
    return _mapStyleInstance!;
  }
}
