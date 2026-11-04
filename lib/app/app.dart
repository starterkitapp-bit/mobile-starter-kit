import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import 'theme/app_theme.dart';

/// The root widget of the Mobile Starter Kit application.
class MainApp extends StatelessWidget {
  /// Creates the root widget.
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.materialLight,
      darkTheme: AppTheme.materialDark,
      themeMode: ThemeMode.system,
      builder: (context, child) {
        final brightness = Theme.brightnessOf(context);

        return FTheme(
          data: AppTheme.forBrightness(brightness),
          child: FToaster(
            child: FTooltipGroup(child: child ?? const SizedBox.shrink()),
          ),
        );
      },
      home: const Scaffold(body: Center(child: Text('Mobile Starter Kit'))),
    );
  }
}
