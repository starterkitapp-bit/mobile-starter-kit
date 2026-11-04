import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'package:mobile_starter_kit/app/app.dart';
import 'package:mobile_starter_kit/app/theme/app_theme_preference.dart';

void main() {
  group('AppThemePreference', () {
    test('maps supported values to theme modes', () {
      expect(AppThemePreference.system.themeMode, ThemeMode.system);
      expect(AppThemePreference.light.themeMode, ThemeMode.light);
      expect(AppThemePreference.dark.themeMode, ThemeMode.dark);
    });

    test('falls back to System for missing or unknown values', () {
      expect(
        AppThemePreference.fromStorageValue(null),
        AppThemePreference.system,
      );
      expect(
        AppThemePreference.fromStorageValue('unexpected'),
        AppThemePreference.system,
      );
    });

    test('loads the saved preference and persists updates', () async {
      final store = _FakeThemePreferenceStore(AppThemePreference.dark);
      final container = ProviderContainer.test(
        overrides: [themePreferenceStoreProvider.overrideWithValue(store)],
      );

      expect(
        container.read(appThemePreferenceProvider),
        AppThemePreference.system,
      );

      await container
          .read(appThemePreferenceProvider.notifier)
          .setPreference(AppThemePreference.light);

      expect(store.saved, AppThemePreference.light);
      expect(
        container.read(appThemePreferenceProvider),
        AppThemePreference.light,
      );
    });

    test('does not publish a preference when persistence fails', () async {
      final store = _FakeThemePreferenceStore(AppThemePreference.system)
        ..shouldFail = true;
      final container = ProviderContainer.test(
        overrides: [themePreferenceStoreProvider.overrideWithValue(store)],
      );

      await expectLater(
        container
            .read(appThemePreferenceProvider.notifier)
            .setPreference(AppThemePreference.dark),
        throwsA(isA<StateError>()),
      );
      expect(
        container.read(appThemePreferenceProvider),
        AppThemePreference.system,
      );
    });

    test('restores a saved Light or Dark preference', () async {
      final preference = await loadInitialThemePreference(
        _FakeThemePreferenceStore(AppThemePreference.dark),
      );

      expect(preference, AppThemePreference.dark);
    });

    test('reports restoration errors and falls back to System', () async {
      final previousHandler = FlutterError.onError;
      final reported = <FlutterErrorDetails>[];
      FlutterError.onError = reported.add;
      addTearDown(() {
        FlutterError.onError = previousHandler;
      });

      final preference = await loadInitialThemePreference(
        _FakeThemePreferenceStore(AppThemePreference.dark)
          ..shouldFail = true,
      );

      expect(preference, AppThemePreference.system);
      expect(reported, hasLength(1));
      expect(reported.single.library, 'theme preference');
    });
  });

  testWidgets('applies an explicit preference at the app root', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          initialThemePreferenceProvider.overrideWithValue(
            AppThemePreference.dark,
          ),
        ],
        child: const MainApp(),
      ),
    );

    expect(
      Theme.of(tester.element(find.text('Mobile Starter Kit'))).brightness,
      Brightness.dark,
    );
  });

  testWidgets(
    'applies an explicit Light preference at the app root',
    (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            initialThemePreferenceProvider.overrideWithValue(
              AppThemePreference.light,
            ),
          ],
          child: const MainApp(),
        ),
      );

      final context = tester.element(find.text('Mobile Starter Kit'));
      expect(Theme.of(context).brightness, Brightness.light);
      expect(FTheme.of(context).colors.brightness, Brightness.light);
    },
  );
}

class _FakeThemePreferenceStore implements ThemePreferenceStore {
  new(this.saved);

  AppThemePreference saved;
  bool shouldFail = false;

  @override
  Future<AppThemePreference> load() async {
    if (shouldFail) {
      throw StateError('read failed');
    }
    return saved;
  }

  @override
  Future<void> save(AppThemePreference preference) async {
    if (shouldFail) {
      throw StateError('write failed');
    }
    saved = preference;
  }
}
