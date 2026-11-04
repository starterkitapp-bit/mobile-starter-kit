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
    final colors = FColors(
      brightness: brightness,
      systemOverlayStyle: isLight
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light,
      barrier: isLight ? const Color(0x52000000) : const Color(0x99000000),
      background: isLight
          ? AppPalette.lightBackground
          : AppPalette.darkBackground,
      foreground: isLight
          ? AppPalette.lightForeground
          : AppPalette.darkForeground,
      primary: isLight ? AppPalette.lightPrimary : AppPalette.darkPrimary,
      primaryForeground: isLight
          ? AppPalette.lightPrimaryForeground
          : AppPalette.darkPrimaryForeground,
      secondary: isLight
          ? AppPalette.lightSecondary
          : AppPalette.darkSecondary,
      secondaryForeground: isLight
          ? AppPalette.lightSecondaryForeground
          : AppPalette.darkSecondaryForeground,
      muted: isLight ? AppPalette.lightMuted : AppPalette.darkMuted,
      mutedForeground: isLight
          ? AppPalette.lightMutedForeground
          : AppPalette.darkMutedForeground,
      destructive: isLight ? AppPalette.lightError : AppPalette.darkError,
      destructiveForeground: AppPalette.onError,
      error: isLight ? AppPalette.lightError : AppPalette.darkError,
      errorForeground: AppPalette.onError,
      card: isLight ? AppPalette.lightSurface : AppPalette.darkSurface,
      border: isLight ? AppPalette.lightBorder : AppPalette.darkBorder,
    );
    final typography = FTypography.inherit(colors: colors, touch: true);
    final style = FStyle.inherit(
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
