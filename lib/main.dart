import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mc_investigation/some_method_channel_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  static const platform = MethodChannel('sample.method.channel');
 
  final mcManager = SomeMethodChannelManager();

  @override
  void initState() {
    print("vovo - _MyHomePageState - setting call handler");
    platform.setMethodCallHandler((call) {
      print('''vovo - _MyHomePageState handling call. 
          Method: ${call.method}, argument: ${call.arguments}''');
      return Future.value('');
    });
  }

  void _incrementCounter() async {
    setState(() {
      _counter++;

      platform.invokeMethod('sampleMethod',
          {'key': 'value', 'aBoolean': false, 'source': '_MyHomePageState'});

      mcManager.invokeMethodChannel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
