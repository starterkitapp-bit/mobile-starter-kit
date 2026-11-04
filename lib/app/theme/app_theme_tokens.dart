import 'package:flutter/material.dart';

/// Monochrome color tokens shared by the app's Light and Dark themes.
abstract final class AppPalette {
  /// Light theme page background.
  static const lightBackground = Color(0xFFFAFAFA);

  /// Light theme primary text and icon color.
  static const lightForeground = Color(0xFF18181B);

  /// Light theme elevated surface color.
  static const lightSurface = Color(0xFFFFFFFF);

  /// Light theme primary action color.
  static const lightPrimary = Color(0xFF18181B);

  /// Content color placed on the Light primary color.
  static const lightPrimaryForeground = Color(0xFFFAFAFA);

  /// Light theme secondary surface color.
  static const lightSecondary = Color(0xFFF4F4F5);

  /// Content color placed on the Light secondary color.
  static const lightSecondaryForeground = Color(0xFF27272A);

  /// Light theme muted surface color.
  static const lightMuted = Color(0xFFF4F4F5);

  /// Light theme secondary text color.
  static const lightMutedForeground = Color(0xFF71717A);

  /// Light theme separator and outline color.
  static const lightBorder = Color(0xFFE4E4E7);

  /// Light theme functional error color.
  static const lightError = Color(0xFFB42318);

  /// Content color placed on the Light error color.
  static const lightErrorForeground = Color(0xFFFFFFFF);

  /// Dark theme page background.
  static const darkBackground = Color(0xFF09090B);

  /// Dark theme primary text and icon color.
  static const darkForeground = Color(0xFFFAFAFA);

  /// Dark theme elevated surface color.
  static const darkSurface = Color(0xFF18181B);

  /// Dark theme primary action color.
  static const darkPrimary = Color(0xFFFAFAFA);

  /// Content color placed on the Dark primary color.
  static const darkPrimaryForeground = Color(0xFF18181B);

  /// Dark theme secondary surface color.
  static const darkSecondary = Color(0xFF27272A);

  /// Content color placed on the Dark secondary color.
  static const darkSecondaryForeground = Color(0xFFFAFAFA);

  /// Dark theme muted surface color.
  static const darkMuted = Color(0xFF27272A);

  /// Dark theme secondary text color.
  static const darkMutedForeground = Color(0xFFA1A1AA);

  /// Dark theme separator and outline color.
  static const darkBorder = Color(0xFF3F3F46);

  /// Dark theme functional error color.
  static const darkError = Color(0xFFFF6B6B);

  /// Content color placed on the Dark error color.
  static const darkErrorForeground = Color(0xFF09090B);
}

/// Shared spacing values in logical pixels, based on a four-point rhythm.
abstract final class AppSpacing {
  /// 2 logical pixels.
  static const xxs = 2.0;

  /// 4 logical pixels.
  static const xs = 4.0;

  /// 8 logical pixels.
  static const sm = 8.0;

  /// 12 logical pixels.
  static const md = 12.0;

  /// 16 logical pixels.
  static const lg = 16.0;

  /// 24 logical pixels.
  static const xl = 24.0;

  /// 32 logical pixels.
  static const xxl = 32.0;

  /// 48 logical pixels.
  static const xxxl = 48.0;

  /// 64 logical pixels.
  static const huge = 64.0;
}

/// Shared rounded-corner radii in logical pixels.
abstract final class AppShape {
  /// Extra-small radius: 4 logical pixels.
  static const xs = 4.0;

  /// Small radius: 8 logical pixels.
  static const sm = 8.0;

  /// Medium radius: 12 logical pixels.
  static const md = 12.0;

  /// Large radius: 16 logical pixels.
  static const lg = 16.0;

  /// Extra-large radius: 20 logical pixels.
  static const xl = 20.0;

  /// Double extra-large radius: 24 logical pixels.
  static const xxl = 24.0;
}

/// Shared type scale used by Material text styles.
///
/// Forui's inherited touch typography uses its corresponding built-in
/// Tailwind-based scale; avoid defining a second font family or size system.
abstract final class AppTypography {
  /// Small label size.
  static const label = 12.0;

  /// Small body text size.
  static const bodySmall = 14.0;

  /// Default body text size.
  static const body = 16.0;

  /// Small title size.
  static const titleSmall = 18.0;

  /// Default title size.
  static const title = 20.0;

  /// Heading size.
  static const heading = 22.0;

  /// Smaller display size.
  static const displaySmall = 30.0;

  /// Default display size.
  static const display = 36.0;
}

/// Motion tokens for purposeful, short interface transitions.
///
/// Widgets must still honor the platform's reduced-motion preference.
abstract final class AppMotion {
  /// Quick feedback transition.
  static const quick = Duration(milliseconds: 120);

  /// Standard state transition.
  static const standard = Duration(milliseconds: 200);

  /// Deliberate transition for larger visual changes.
  static const deliberate = Duration(milliseconds: 280);

  /// Standard easing curve.
  static const standardCurve = Curves.easeInOut;
}
