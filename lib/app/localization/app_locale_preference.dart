import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The user's app-wide language preference.
enum AppLocalePreference {
  /// Follow the device locale when it is supported.
  system,

  /// Always use Arabic.
  arabic,

  /// Always use English.
  english;

  /// The explicit locale, or null when following the system.
  Locale? get locale => switch (this) {
    system => null,
    arabic => const Locale('ar'),
    english => const Locale('en'),
  };

  /// Parses a stored value, defaulting safely to [system].
  static AppLocalePreference fromStorageValue(String? value) => switch (
    value
  ) {
    'arabic' => arabic,
    'english' => english,
    _ => system,
  };
}

/// Resolves the first supported device language, with English as fallback.
Locale resolveSystemAppLocale(List<Locale>? preferredLocales) {
  for (final locale in preferredLocales ?? const <Locale>[]) {
    switch (locale.languageCode) {
      case 'ar':
        return const Locale('ar');
      case 'en':
        return const Locale('en');
    }
  }

  return const Locale('en');
}

/// Minimal persistence boundary for the app locale preference.
abstract interface class LocalePreferenceStore {
  /// Reads the saved preference, defaulting to System when absent or invalid.
  Future<AppLocalePreference> load();

  /// Persists [preference].
  Future<void> save(AppLocalePreference preference);
}

/// SharedPreferencesAsync implementation for the locale preference.
class SharedPreferencesLocalePreferenceStore implements LocalePreferenceStore {
  /// Creates the store, optionally with an injected preferences instance.
  new({SharedPreferencesAsync? preferences})
    : _preferences = preferences ?? SharedPreferencesAsync();

  static const _key = 'app.locale_preference';

  final SharedPreferencesAsync _preferences;

  @override
  Future<AppLocalePreference> load() async =>
      AppLocalePreference.fromStorageValue(await _preferences.getString(_key));

  @override
  Future<void> save(AppLocalePreference preference) =>
      _preferences.setString(_key, preference.name);
}

/// Loads the preference before the first app frame.
///
/// A preference-store failure is non-fatal: report it and use System mode.
Future<AppLocalePreference> loadInitialLocalePreference(
  LocalePreferenceStore store,
) async {
  try {
    return await store.load();
  } on Object catch (error, stackTrace) {
    FlutterError.reportError(
      FlutterErrorDetails(
        exception: error,
        stack: stackTrace,
        library: 'locale preference',
        context: ErrorDescription(
          'while restoring the saved locale preference',
        ),
      ),
    );
    return AppLocalePreference.system;
  }
}

/// The persistence implementation used by the locale controller.
final localePreferenceStoreProvider = Provider<LocalePreferenceStore>(
  (ref) => SharedPreferencesLocalePreferenceStore(),
);

/// The preference restored before the app is launched.
final initialLocalePreferenceProvider = Provider<AppLocalePreference>(
  (ref) => AppLocalePreference.system,
);

/// The single source of truth for the current locale preference.
final appLocalePreferenceProvider =
    NotifierProvider<AppLocalePreferenceController, AppLocalePreference>(
      AppLocalePreferenceController.new,
    );

/// Controls and persists the app-wide locale preference.
class AppLocalePreferenceController extends Notifier<AppLocalePreference> {
  @override
  AppLocalePreference build() => ref.watch(initialLocalePreferenceProvider);

  /// Saves [preference] before publishing it to the UI.
  ///
  /// If persistence fails, the current in-memory preference is unchanged.
  Future<void> setPreference(AppLocalePreference preference) async {
    if (preference == state) {
      return;
    }

    await ref.read(localePreferenceStoreProvider).save(preference);
    state = preference;
  }
}
