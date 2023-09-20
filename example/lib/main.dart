import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get_radio_version_plugin/get_radio_version_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _radioVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initRadioVersionState();
  }

  // Radio version are asynchronous, so we initialize in an async method.
  Future<void> initRadioVersionState() async {
    String radioVersion;
    // Radio Version may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      radioVersion =
          await GetRadioVersionPlugin.radioVersion ?? 'Unknown radio version';
    } on PlatformException {
      radioVersion = 'Failed to get radio version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _radioVersion = radioVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Radio Version : $_radioVersion\n'),
        ),
      ),
    );
  }
}
