import 'package:flutter/material.dart';

/// The root widget of the Mobile Starter Kit application.
class MainApp extends StatelessWidget {
  /// Creates the root widget.
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Mobile Starter Kit'))),
    );
  }
}
