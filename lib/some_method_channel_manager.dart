import 'package:flutter/services.dart';

class SomeMethodChannelManager {
  final mc = MethodChannel('sample.method.channel');

  SomeMethodChannelManager() {
    print("vovo - SomeMethodChannelManager - setting call handler");
    mc.setMethodCallHandler((call) {
      print('''vovo - SomeMethodChannelManager handling call. 
          Method: ${call.method}, argument: ${call.arguments}''');
      return Future.value('');
    });
  }

  void invokeMethodChannel() {
    mc.invokeMethod(
      'sampleMethod',
      {'key': 'value', 'aBoolean': false, 'source': 'SomeMethodChannelManager'},
    );
  }
}
