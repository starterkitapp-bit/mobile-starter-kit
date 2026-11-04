import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';

import 'package:mobile_starter_kit/app/localization/app_locale_preference.dart';
import 'package:mobile_starter_kit/app/localization/generated/app_localizations.dart';
import 'package:mobile_starter_kit/app/theme/app_theme.dart';
import 'package:mobile_starter_kit/app/theme/app_theme_preference.dart';

/// The root widget of the Mobile Starter Kit application.
class MainApp extends ConsumerWidget {
  /// Creates the root widget.
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themePreference = ref.watch(appThemePreferenceProvider);
    final localePreference = ref.watch(appLocalePreferenceProvider);

    return MaterialApp(
      theme: AppTheme.materialLight,
      darkTheme: AppTheme.materialDark,
      themeMode: themePreference.themeMode,
      locale: localePreference.locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      localeListResolutionCallback: (locales, supportedLocales) =>
          resolveSystemAppLocale(locales),
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      builder: (context, child) {
        final brightness = Theme.brightnessOf(context);

        return FTheme(
          data: AppTheme.forBrightness(brightness),
          child: FToaster(
            child: FTooltipGroup(child: child ?? const SizedBox.shrink()),
          ),
        );
      },
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(child: Text(AppLocalizations.of(context)!.appTitle)),
        ),
      ),
    );
  }
}
