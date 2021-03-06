import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:plugin_mirrar/plugin_mirrar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  void launchTryOn() {
    var options = {
      "brandId": "c41ade6a-fd1c-4e8b-ac78-4df64da8ae5f",
      "productData": {
        "Bracelets": {
          "items": ["BR-01", "BR-02", "BR-03"],
          "type": "wrist"
        },
        "Earrings": {
          "items": ["1503677279384_RIB_2113_1", "CT-2032", "CS2124E"],
          "type": "ear"
        },
        "Rings": {
          "items": ["RN-01", "RN-013", "RN-01543"],
          "type": "finger"
        },
        "Sets": {
          "items": ["CS-414"],
          "type": "set"
        }
      }
    };
    PluginMirrar.launchTyrOn(options);

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: launchTryOn,
            child: Text('Launch Try-On'),
          ),
        ),
      ),
    );
  }
}
