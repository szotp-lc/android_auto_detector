import 'package:android_auto_detector/android_auto_detector.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _stream = AndroidAutoDetector().isConnected();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: StreamBuilder(
            stream: _stream,
            builder: (context, snapshot) {
              return Text('${snapshot.data}');
            },
          ),
        ),
      ),
    );
  }
}
