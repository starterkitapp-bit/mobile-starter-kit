import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forui/forui.dart';

import 'app_theme_tokens.dart';

/// The centralized Light and Dark theme definitions for the application.
abstract final class AppTheme {
  static final FThemeData light = _createTheme(Brightness.light);
  static final FThemeData dark = _createTheme(Brightness.dark);

  static final ThemeData materialLight = light.toApproximateMaterialTheme();
  static final ThemeData materialDark = dark.toApproximateMaterialTheme();

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
      destructiveForeground: AppPalette.onError,
      error: error,
      errorForeground: AppPalette.onError,
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
            xs2: BorderRadius.all(Radius.circular(AppShape.xs)),
            xs: BorderRadius.all(Radius.circular(AppShape.xs)),
            sm: BorderRadius.all(Radius.circular(AppShape.sm)),
            md: BorderRadius.all(Radius.circular(AppShape.md)),
            lg: BorderRadius.all(Radius.circular(AppShape.lg)),
            xl: BorderRadius.all(Radius.circular(AppShape.xl)),
            xl2: BorderRadius.all(Radius.circular(AppShape.xxl)),
            xl3: BorderRadius.all(Radius.circular(AppShape.xxl)),
          ),
          pagePadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
        );

    return FThemeData(
      colors: colors,
      typography: typography,
      style: style,
      touch: true,
    );
  }
}
