import 'package:flutter/material.dart';

/// Monochrome color tokens shared by the app's Light and Dark themes.
abstract final class AppPalette {
  static const lightBackground = Color(0xFFFAFAFA);
  static const lightForeground = Color(0xFF18181B);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightPrimary = Color(0xFF18181B);
  static const lightPrimaryForeground = Color(0xFFFAFAFA);
  static const lightSecondary = Color(0xFFF4F4F5);
  static const lightSecondaryForeground = Color(0xFF27272A);
  static const lightMuted = Color(0xFFF4F4F5);
  static const lightMutedForeground = Color(0xFF71717A);
  static const lightBorder = Color(0xFFE4E4E7);

  static const darkBackground = Color(0xFF09090B);
  static const darkForeground = Color(0xFFFAFAFA);
  static const darkSurface = Color(0xFF18181B);
  static const darkPrimary = Color(0xFFFAFAFA);
  static const darkPrimaryForeground = Color(0xFF18181B);
  static const darkSecondary = Color(0xFF27272A);
  static const darkSecondaryForeground = Color(0xFFFAFAFA);
  static const darkMuted = Color(0xFF27272A);
  static const darkMutedForeground = Color(0xFFA1A1AA);
  static const darkBorder = Color(0xFF3F3F46);

  /// Functional feedback colors; these are intentionally not brand accents.
  static const lightError = Color(0xFFB42318);
  static const darkError = Color(0xFFFF6B6B);
  static const onError = Color(0xFFFFFFFF);
}

abstract final class AppSpacing {
  static const xxs = 2.0;
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;
  static const xxl = 32.0;
  static const xxxl = 48.0;
  static const huge = 64.0;
}

abstract final class AppShape {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 20.0;
  static const xxl = 24.0;
}

abstract final class AppMotion {
  static const quick = Duration(milliseconds: 120);
  static const standard = Duration(milliseconds: 200);
  static const deliberate = Duration(milliseconds: 280);

  static const standardCurve = Curves.easeInOut;
}
