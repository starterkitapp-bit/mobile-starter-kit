import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_starter_kit/app/app.dart';
import 'package:mobile_starter_kit/app/bootstrap/app_bootstrap.dart';
import 'package:mobile_starter_kit/app/localization/app_locale_preference.dart';
import 'package:mobile_starter_kit/app/theme/app_theme_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = SharedPreferencesAsync();
  final themePreferenceStore = SharedPreferencesThemePreferenceStore(
    preferences: preferences,
  );
  final localePreferenceStore = SharedPreferencesLocalePreferenceStore(
    preferences: preferences,
  );
  final initialThemePreference = await loadInitialThemePreference(
    themePreferenceStore,
  );
  final initialLocalePreference = await loadInitialLocalePreference(
    localePreferenceStore,
  );

  await initApp(
    app: const MainApp(),
    providerScopeBuilder: (child) => ProviderScope(
      overrides: [
        themePreferenceStoreProvider.overrideWithValue(themePreferenceStore),
        initialThemePreferenceProvider.overrideWithValue(
          initialThemePreference,
        ),
        localePreferenceStoreProvider.overrideWithValue(localePreferenceStore),
        initialLocalePreferenceProvider.overrideWithValue(
          initialLocalePreference,
        ),
      ],
      child: child,
    ),
  );
}
