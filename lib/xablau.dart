import 'package:flutter/services.dart';

class Xablau {
  static const xablauPlatform = MethodChannel('sample.method.channel');

  static void lala() {
    xablauPlatform.invokeMethod('sample.method.channel',
        {'key': 'value', 'aBoolean': false, 'source': 'Xablau'});
  }
}
