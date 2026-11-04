import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

/// The root widget of the Mobile Starter Kit application.
class MainApp extends StatelessWidget {
  /// Creates the root widget.
  new({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
