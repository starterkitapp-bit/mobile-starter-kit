import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The user's app-wide appearance preference.
enum AppThemePreference {
  /// Follow the operating system appearance.
  system,

  /// Always use the Light theme.
  light,

  /// Always use the Dark theme.
  dark;

  /// The matching Material theme mode.
  ThemeMode get themeMode => switch (this) {
    system => ThemeMode.system,
    light => ThemeMode.light,
    dark => ThemeMode.dark,
  };

  /// Parses a stored value, defaulting safely to [system].
  static AppThemePreference fromStorageValue(String? value) => switch (value) {
    'light' => light,
    'dark' => dark,
    _ => system,
  };
}

/// Minimal persistence boundary for the app theme preference.
abstract interface class ThemePreferenceStore {
  /// Reads the saved preference, defaulting to System when absent or invalid.
  Future<AppThemePreference> load();

  /// Persists [preference].
  Future<void> save(AppThemePreference preference);
}

/// SharedPreferencesAsync implementation for the theme preference.
class SharedPreferencesThemePreferenceStore implements ThemePreferenceStore {
  /// Creates the store, optionally with an injected preferences instance.
  SharedPreferencesThemePreferenceStore({
    SharedPreferencesAsync? preferences,
  }) : _preferences = preferences ?? SharedPreferencesAsync();

  static const _key = 'app.theme_preference';

  final SharedPreferencesAsync _preferences;

  @override
  Future<AppThemePreference> load() async =>
      AppThemePreference.fromStorageValue(await _preferences.getString(_key));

  @override
  Future<void> save(AppThemePreference preference) =>
      _preferences.setString(_key, preference.name);
}

/// Loads the preference before the first app frame.
///
/// A preference-store failure is non-fatal: report it and use System mode.
Future<AppThemePreference> loadInitialThemePreference(
  ThemePreferenceStore store,
) async {
  try {
    return await store.load();
  } on Object catch (error, stackTrace) {
    FlutterError.reportError(
      FlutterErrorDetails(
        exception: error,
        stack: stackTrace,
        library: 'theme preference',
        context: ErrorDescription('while restoring the saved theme preference'),
      ),
    );
    return AppThemePreference.system;
  }
}

/// The persistence implementation used by the theme controller.
final themePreferenceStoreProvider = Provider<ThemePreferenceStore>(
  (ref) => SharedPreferencesThemePreferenceStore(),
);

/// The preference restored before the app is launched.
final initialThemePreferenceProvider = Provider<AppThemePreference>(
  (ref) => AppThemePreference.system,
);

/// The single source of truth for the current theme preference.
final appThemePreferenceProvider =
    NotifierProvider<AppThemePreferenceController, AppThemePreference>(
      AppThemePreferenceController.new,
    );

/// Controls and persists the app-wide theme preference.
class AppThemePreferenceController extends Notifier<AppThemePreference> {
  @override
  AppThemePreference build() => ref.watch(initialThemePreferenceProvider);

  /// Saves [preference] before publishing it to the UI.
  ///
  /// If persistence fails, the current in-memory preference is unchanged.
  Future<void> setPreference(AppThemePreference preference) async {
    if (preference == state) {
      return;
    }

    await ref.read(themePreferenceStoreProvider).save(preference);
    state = preference;
  }
}
