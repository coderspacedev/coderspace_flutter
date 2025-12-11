import 'package:flutter/material.dart';

/// A model that holds all custom colors used in the app
class CoderColor {
  final Color primary; // Main brand / primary color
  final Color background; // App background
  final Color card; // Card / surface background
  final Color cardText; // Text color on card
  final Color text; // General text color
  final Color accent; // Accent (button / highlight)
  final Color accentText; // Text color on accent

  const CoderColor({
    required this.primary,
    required this.background,
    required this.card,
    required this.cardText,
    required this.text,
    required this.accent,
    required this.accentText,
  });
}

// 🔹 Light theme
const lightCoderColor = CoderColor(
  primary: Color(0xFFFFFFFF),
  background: Color(0xFFFBFBFB),
  card: Color(0xFFF3F3F3),
  cardText: Color(0xFF101010),
  text: Color(0xFF101010),
  accent: Color(0xFF5F55E3),
  accentText: Color(0xFFFFFFFF),
);

// 🔹 Dark theme
const darkCoderColor = CoderColor(
  primary: Color(0xFF121212),
  background: Color(0xFF000000),
  card: Color(0xFF0F0F10),
  cardText: Color(0xFFFFFFFF),
  text: Color(0xFFFFFFFF),
  accent: Color(0xFF017AEF),
  accentText: Color(0xFFFFFFFF),
);

// Access color easily
Color get background => AppTheme.colors.background;
Color get bg => AppTheme.colors.background;
Color get text => AppTheme.colors.text;
Color get card => AppTheme.colors.card;
Color get cardText => AppTheme.colors.cardText;
Color get accent => AppTheme.colors.accent;
Color get accentText => AppTheme.colors.accentText;

/// Theme manager that switches between light and dark CoderColors
class AppTheme {
  // Store light and dark theme color sets
  static CoderColor _lightColors = lightCoderColor;
  static CoderColor _darkColors = darkCoderColor;

  // Current mode (false = light, true = dark)
  static bool _isDark = false;

  /// Get the current color set based on theme mode
  static CoderColor get colors => _isDark ? _darkColors : _lightColors;

  /// Force light theme
  static void useLight() => _isDark = false;

  /// Force dark theme
  static void useDark() => _isDark = true;

  /// Replace light colors dynamically (e.g. custom themes)
  static void setLightColors(CoderColor colors) => _lightColors = colors;

  /// Replace dark colors dynamically (e.g. custom themes)
  static void setDarkColors(CoderColor colors) => _darkColors = colors;

  /// Automatically switch theme based on system brightness
  static void autoSwitch(Brightness brightness) {
    _isDark = brightness == Brightness.dark;
  }
}
