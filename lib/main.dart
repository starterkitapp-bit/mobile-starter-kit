import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_starter_kit/app/app.dart';
import 'package:mobile_starter_kit/app/bootstrap/app_bootstrap.dart';
import 'package:mobile_starter_kit/app/theme/app_theme_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferenceStore = SharedPreferencesThemePreferenceStore(
    preferences: SharedPreferencesAsync(),
  );
  final initialPreference = await loadInitialThemePreference(preferenceStore);

  await initApp(
    app: const MainApp(),
    providerScopeBuilder: (child) => ProviderScope(
      overrides: [
        themePreferenceStoreProvider.overrideWithValue(preferenceStore),
        initialThemePreferenceProvider.overrideWithValue(initialPreference),
      ],
      child: child,
    ),
  );
}
