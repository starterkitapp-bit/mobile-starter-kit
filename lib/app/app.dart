import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';

import 'package:mobile_starter_kit/app/theme/app_theme.dart';
import 'package:mobile_starter_kit/app/theme/app_theme_preference.dart';

/// The root widget of the Mobile Starter Kit application.
class MainApp extends ConsumerWidget {
  /// Creates the root widget.
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themePreference = ref.watch(appThemePreferenceProvider);

    return MaterialApp(
      theme: AppTheme.materialLight,
      darkTheme: AppTheme.materialDark,
      themeMode: themePreference.themeMode,
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
