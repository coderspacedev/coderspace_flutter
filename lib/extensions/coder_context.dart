import 'package:flutter/material.dart';

/// An extension on [BuildContext] providing quick access to common screen
/// and theme properties.
///
/// Useful for responsive design, system UI calculations, and adapting to theme mode.
extension ContextExtension on BuildContext {
  /// Returns the total width of the screen in logical pixels.
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Returns the total height of the screen in logical pixels.
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Returns the top system padding (e.g., status bar height).
  double get paddingTop => MediaQuery.of(this).padding.top;

  /// Returns the left system padding (e.g., for notched devices).
  double get paddingLeft => MediaQuery.of(this).padding.left;

  /// Returns the bottom system padding (e.g., for gesture navigation or system bar).
  double get paddingBottom => MediaQuery.of(this).padding.bottom;

  /// Returns the right system padding.
  double get paddingRight => MediaQuery.of(this).padding.right;

  /// Returns the screen height excluding top and bottom system paddings.
  ///
  /// Helpful for layout calculations inside safe areas.
  double get screenHeightWithoutSystemBars =>
      MediaQuery.of(this).size.height -
      MediaQuery.of(this).padding.top -
      MediaQuery.of(this).padding.bottom;

  /// Returns `true` if the device is currently in portrait orientation.
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  /// Returns `true` if the device is currently in landscape orientation.
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  /// Returns `true` if the device is considered a tablet (shortest side >= 600dp).
  bool get isTabletSize => MediaQuery.of(this).size.shortestSide >= 600;

  /// Returns `true` if the current theme is dark mode.
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
