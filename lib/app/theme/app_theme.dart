import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forui/forui.dart';

import 'package:mobile_starter_kit/app/theme/app_theme_tokens.dart';

/// The centralized Light and Dark theme definitions for the application.
abstract final class AppTheme {
  /// The complete Light theme for Forui widgets.
  static final FThemeData light = _createTheme(Brightness.light);

  /// The complete Dark theme for Forui widgets.
  static final FThemeData dark = _createTheme(Brightness.dark);

  /// The matching Flutter Material Light theme.
  static final ThemeData materialLight = _createMaterialTheme(Brightness.light);

  /// The matching Flutter Material Dark theme.
  static final ThemeData materialDark = _createMaterialTheme(Brightness.dark);

  /// Returns the Forui theme matching the effective app brightness.
  static FThemeData forBrightness(Brightness brightness) =>
      brightness == Brightness.dark ? dark : light;

  static FThemeData _createTheme(Brightness brightness) {
    final isLight = brightness == Brightness.light;
    final systemOverlayStyle = isLight
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light;
    final barrier = isLight ? const Color(0x52000000) : const Color(0x99000000);
    final background = isLight
        ? AppPalette.lightBackground
        : AppPalette.darkBackground;
    final foreground = isLight
        ? AppPalette.lightForeground
        : AppPalette.darkForeground;
    final primary = isLight ? AppPalette.lightPrimary : AppPalette.darkPrimary;
    final primaryForeground = isLight
        ? AppPalette.lightPrimaryForeground
        : AppPalette.darkPrimaryForeground;
    final secondary = isLight
        ? AppPalette.lightSecondary
        : AppPalette.darkSecondary;
    final secondaryForeground = isLight
        ? AppPalette.lightSecondaryForeground
        : AppPalette.darkSecondaryForeground;
    final muted = isLight ? AppPalette.lightMuted : AppPalette.darkMuted;
    final mutedForeground = isLight
        ? AppPalette.lightMutedForeground
        : AppPalette.darkMutedForeground;
    final error = isLight ? AppPalette.lightError : AppPalette.darkError;
    final errorForeground = isLight
        ? AppPalette.lightErrorForeground
        : AppPalette.darkErrorForeground;
    final card = isLight ? AppPalette.lightSurface : AppPalette.darkSurface;
    final border = isLight ? AppPalette.lightBorder : AppPalette.darkBorder;

    final colors = FColors(
      brightness: brightness,
      systemOverlayStyle: systemOverlayStyle,
      barrier: barrier,
      background: background,
      foreground: foreground,
      primary: primary,
      primaryForeground: primaryForeground,
      secondary: secondary,
      secondaryForeground: secondaryForeground,
      muted: muted,
      mutedForeground: mutedForeground,
      destructive: error,
      destructiveForeground: errorForeground,
      error: error,
      errorForeground: errorForeground,
      card: card,
      border: border,
    );
    final typography = FTypography.inherit(colors: colors, touch: true);
    final style =
        FStyle.inherit(
          colors: colors,
          typography: typography,
          touch: true,
        ).copyWith(
          borderRadius: const FBorderRadius(
            xs: BorderRadius.all(Radius.circular(AppShape.xs)),
            md: BorderRadius.all(Radius.circular(AppShape.md)),
            lg: BorderRadius.all(Radius.circular(AppShape.lg)),
            xl: BorderRadius.all(Radius.circular(AppShape.xl)),
            xl2: BorderRadius.all(Radius.circular(AppShape.xxl)),
            xl3: BorderRadius.all(Radius.circular(AppShape.xxl)),
          ),
          pagePadding: const EdgeInsetsDelta.value(
            EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.sm,
            ),
          ),
        );

    return FThemeData(
      colors: colors,
      typography: typography,
      style: style,
      touch: true,
    );
  }

  static ThemeData _createMaterialTheme(Brightness brightness) {
    final isLight = brightness == Brightness.light;
    final primary = isLight ? AppPalette.lightPrimary : AppPalette.darkPrimary;
    final primaryForeground = isLight
        ? AppPalette.lightPrimaryForeground
        : AppPalette.darkPrimaryForeground;
    final secondary = isLight
        ? AppPalette.lightSecondary
        : AppPalette.darkSecondary;
    final secondaryForeground = isLight
        ? AppPalette.lightSecondaryForeground
        : AppPalette.darkSecondaryForeground;
    final foreground = isLight
        ? AppPalette.lightForeground
        : AppPalette.darkForeground;
    final background = isLight
        ? AppPalette.lightBackground
        : AppPalette.darkBackground;
    final surface = isLight ? AppPalette.lightSurface : AppPalette.darkSurface;
    final error = isLight ? AppPalette.lightError : AppPalette.darkError;
    final errorForeground = isLight
        ? AppPalette.lightErrorForeground
        : AppPalette.darkErrorForeground;
    final border = isLight ? AppPalette.lightBorder : AppPalette.darkBorder;

    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: primary,
          brightness: brightness,
        ).copyWith(
          primary: primary,
          onPrimary: primaryForeground,
          primaryContainer: secondary,
          onPrimaryContainer: secondaryForeground,
          secondary: secondary,
          onSecondary: secondaryForeground,
          secondaryContainer: secondary,
          onSecondaryContainer: secondaryForeground,
          tertiary: secondary,
          onTertiary: secondaryForeground,
          tertiaryContainer: secondary,
          onTertiaryContainer: secondaryForeground,
          error: error,
          onError: errorForeground,
          surface: surface,
          onSurface: foreground,
          onSurfaceVariant: isLight
              ? AppPalette.lightMutedForeground
              : AppPalette.darkMutedForeground,
          outline: border,
          outlineVariant: border,
          surfaceTint: Colors.transparent,
          shadow: Colors.black,
          scrim: barrier,
          inverseSurface: foreground,
          onInverseSurface: background,
          inversePrimary: primaryForeground,
          surfaceDim: background,
          surfaceBright: surface,
          surfaceContainerLowest: background,
          surfaceContainerLow: background,
          surfaceContainer: surface,
          surfaceContainerHigh: secondary,
          surfaceContainerHighest: secondary,
        );
    final baseTextTheme = isLight
        ? Typography.material2021().black
        : Typography.material2021().white;
    final textTheme = baseTextTheme
        .apply(bodyColor: foreground, displayColor: foreground)
        .copyWith(
          displayLarge: baseTextTheme.displayLarge?.copyWith(
            fontSize: AppTypography.display,
          ),
          displayMedium: baseTextTheme.displayMedium?.copyWith(
            fontSize: AppTypography.displaySmall,
          ),
          headlineLarge: baseTextTheme.headlineLarge?.copyWith(
            fontSize: AppTypography.heading,
          ),
          headlineMedium: baseTextTheme.headlineMedium?.copyWith(
            fontSize: AppTypography.title,
          ),
          headlineSmall: baseTextTheme.headlineSmall?.copyWith(
            fontSize: AppTypography.titleSmall,
          ),
          bodyLarge: baseTextTheme.bodyLarge?.copyWith(
            fontSize: AppTypography.body,
          ),
          bodyMedium: baseTextTheme.bodyMedium?.copyWith(
            fontSize: AppTypography.bodySmall,
          ),
          bodySmall: baseTextTheme.bodySmall?.copyWith(
            fontSize: AppTypography.label,
          ),
        );

    return ThemeData(
      brightness: brightness,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: background,
      canvasColor: background,
      cardColor: surface,
      dividerColor: border,
      useMaterial3: true,
    );
  }
}
