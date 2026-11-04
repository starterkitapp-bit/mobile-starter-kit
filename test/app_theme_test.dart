import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'package:mobile_starter_kit/app/app.dart';
import 'package:mobile_starter_kit/app/theme/app_theme.dart';
import 'package:mobile_starter_kit/app/theme/app_theme_tokens.dart';

void main() {
  group('AppTheme', () {
    test('exposes stable Light and Dark Forui themes', () {
      expect(AppTheme.light.colors.brightness, Brightness.light);
      expect(AppTheme.dark.colors.brightness, Brightness.dark);
      expect(AppTheme.forBrightness(Brightness.light), same(AppTheme.light));
      expect(AppTheme.forBrightness(Brightness.dark), same(AppTheme.dark));
    });

    test('keeps Material and Forui colors aligned', () {
      expect(AppTheme.materialLight.brightness, Brightness.light);
      expect(AppTheme.materialDark.brightness, Brightness.dark);
      expect(
        AppTheme.materialLight.colorScheme.primary,
        AppTheme.light.colors.primary,
      );
      expect(
        AppTheme.materialDark.colorScheme.surface,
        AppTheme.dark.colors.card,
      );
      expect(
        AppTheme.materialLight.colorScheme.tertiary,
        AppPalette.lightSecondary,
      );
      expect(
        AppTheme.materialDark.colorScheme.tertiary,
        AppPalette.darkSecondary,
      );
      expect(
        AppTheme.materialLight.colorScheme.surfaceTint,
        Colors.transparent,
      );
    });

    test('uses accessible foreground contrast for theme states', () {
      expect(
        _contrastRatio(AppPalette.lightForeground, AppPalette.lightBackground),
        greaterThanOrEqualTo(4.5),
      );
      expect(
        _contrastRatio(AppPalette.darkForeground, AppPalette.darkBackground),
        greaterThanOrEqualTo(4.5),
      );
      expect(
        _contrastRatio(
          AppPalette.lightPrimaryForeground,
          AppPalette.lightPrimary,
        ),
        greaterThanOrEqualTo(4.5),
      );
      expect(
        _contrastRatio(
          AppPalette.darkPrimaryForeground,
          AppPalette.darkPrimary,
        ),
        greaterThanOrEqualTo(4.5),
      );
      expect(
        _contrastRatio(AppPalette.lightErrorForeground, AppPalette.lightError),
        greaterThanOrEqualTo(4.5),
      );
      expect(
        _contrastRatio(AppPalette.darkErrorForeground, AppPalette.darkError),
        greaterThanOrEqualTo(4.5),
      );
    });

    test('uses the shared spacing and rounded shape tokens', () {
      expect(AppTheme.light.style.pagePadding.horizontal, 32);
      expect(AppTheme.light.style.borderRadius.md, BorderRadius.circular(12));
      expect(AppSpacing.lg, 16);
    });
  });

  testWidgets('tracks system brightness', (tester) async {
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
    addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);

    await tester.pumpWidget(const MainApp());

    final context = tester.element(find.text('Mobile Starter Kit'));
    expect(FTheme.of(context).colors.brightness, Brightness.dark);
    expect(Theme.of(context).brightness, Brightness.dark);

    tester.platformDispatcher.platformBrightnessTestValue = Brightness.light;
    await tester.pumpAndSettle();

    final lightContext = tester.element(find.text('Mobile Starter Kit'));
    expect(FTheme.of(lightContext).colors.brightness, Brightness.light);
    expect(Theme.of(lightContext).brightness, Brightness.light);
  });
}

double _contrastRatio(Color foreground, Color background) {
  final foregroundLuminance = foreground.computeLuminance();
  final backgroundLuminance = background.computeLuminance();
  final lighter = foregroundLuminance > backgroundLuminance
      ? foregroundLuminance
      : backgroundLuminance;
  final darker = foregroundLuminance > backgroundLuminance
      ? backgroundLuminance
      : foregroundLuminance;

  return (lighter + 0.05) / (darker + 0.05);
}
