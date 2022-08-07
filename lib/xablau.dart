import 'package:flutter/services.dart';

class Xablau {
  static const xablauPlatform = MethodChannel('sample.method.channel');

  Xablau() {
    print('Xablau: setting method call handler');
    xablauPlatform.setMethodCallHandler((_) {
      print("Xablau: handling call");
      return Future.value();
    });
  }

  void lala() {
    xablauPlatform.invokeMethod('sample.method.channel',
        {'key': 'value', 'aBoolean': false, 'source': 'Xablau'});
  }
}
