import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_starter_kit/app/app.dart';
import 'package:mobile_starter_kit/app/localization/app_locale_preference.dart';

void main() {
  group('AppLocalePreference', () {
    test('maps stored values and falls back to System', () {
      expect(
        AppLocalePreference.fromStorageValue('arabic'),
        AppLocalePreference.arabic,
      );
      expect(
        AppLocalePreference.fromStorageValue('english'),
        AppLocalePreference.english,
      );
      expect(
        AppLocalePreference.fromStorageValue(null),
        AppLocalePreference.system,
      );
      expect(
        AppLocalePreference.fromStorageValue('unexpected'),
        AppLocalePreference.system,
      );
    });

    test('maps explicit preferences to locales', () {
      expect(AppLocalePreference.system.locale, isNull);
      expect(AppLocalePreference.arabic.locale, const Locale('ar'));
      expect(AppLocalePreference.english.locale, const Locale('en'));
    });

    test('resolves the first supported device locale', () {
      expect(
        resolveSystemAppLocale(const [Locale('ar', 'EG'), Locale('en')]),
        const Locale('ar'),
      );
      expect(
        resolveSystemAppLocale(const [Locale('fr'), Locale('en', 'US')]),
        const Locale('en'),
      );
      expect(
        resolveSystemAppLocale(const [Locale('fr'), Locale('ar')]),
        const Locale('ar'),
      );
      expect(resolveSystemAppLocale(const [Locale('fr')]), const Locale('en'));
      expect(resolveSystemAppLocale(null), const Locale('en'));
      expect(resolveSystemAppLocale(const []), const Locale('en'));
    });

    test('loads and persists preference changes', () async {
      final store = _FakeLocalePreferenceStore(AppLocalePreference.arabic);
      final container = ProviderContainer.test(
        overrides: [localePreferenceStoreProvider.overrideWithValue(store)],
      );

      expect(
        container.read(appLocalePreferenceProvider),
        AppLocalePreference.system,
      );

      await container
          .read(appLocalePreferenceProvider.notifier)
          .setPreference(AppLocalePreference.english);

      expect(store.saved, AppLocalePreference.english);
      expect(
        container.read(appLocalePreferenceProvider),
        AppLocalePreference.english,
      );
    });

    test('does not publish a preference when persistence fails', () async {
      final store = _FakeLocalePreferenceStore(AppLocalePreference.system)
        ..shouldFail = true;
      final container = ProviderContainer.test(
        overrides: [localePreferenceStoreProvider.overrideWithValue(store)],
      );

      await expectLater(
        container
            .read(appLocalePreferenceProvider.notifier)
            .setPreference(AppLocalePreference.arabic),
        throwsA(isA<StateError>()),
      );
      expect(
        container.read(appLocalePreferenceProvider),
        AppLocalePreference.system,
      );
    });

    test('restores a saved preference', () async {
      final preference = await loadInitialLocalePreference(
        _FakeLocalePreferenceStore(AppLocalePreference.arabic),
      );

      expect(preference, AppLocalePreference.arabic);
    });

    test('reports restoration errors and falls back to System', () async {
      final previousHandler = FlutterError.onError;
      final reported = <FlutterErrorDetails>[];
      FlutterError.onError = reported.add;
      addTearDown(() {
        FlutterError.onError = previousHandler;
      });

      final preference = await loadInitialLocalePreference(
        _FakeLocalePreferenceStore(AppLocalePreference.english)
          ..shouldFail = true,
      );

      expect(preference, AppLocalePreference.system);
      expect(reported, hasLength(1));
      expect(reported.single.library, 'locale preference');
    });
  });

  testWidgets('renders Arabic text with RTL direction', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          initialLocalePreferenceProvider.overrideWithValue(
            AppLocalePreference.arabic,
          ),
        ],
        child: const MainApp(),
      ),
    );

    const arabicTitle = 'مجموعة البداية لتطبيقات الهاتف';
    final context = tester.element(find.text(arabicTitle));
    expect(find.text(arabicTitle), findsOneWidget);
    expect(Directionality.of(context), TextDirection.rtl);
  });

  testWidgets('renders English text with LTR direction', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          initialLocalePreferenceProvider.overrideWithValue(
            AppLocalePreference.english,
          ),
        ],
        child: const MainApp(),
      ),
    );

    final context = tester.element(find.text('Mobile Starter Kit'));
    expect(find.text('Mobile Starter Kit'), findsOneWidget);
    expect(Directionality.of(context), TextDirection.ltr);
  });
}

class _FakeLocalePreferenceStore implements LocalePreferenceStore {
  new(this.saved);

  AppLocalePreference saved;
  bool shouldFail = false;

  @override
  Future<AppLocalePreference> load() async {
    if (shouldFail) {
      throw StateError('read failed');
    }
    return saved;
  }

  @override
  Future<void> save(AppLocalePreference preference) async {
    if (shouldFail) {
      throw StateError('write failed');
    }
    saved = preference;
  }
}
