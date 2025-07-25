import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get paddingTop => MediaQuery.of(this).padding.top;
  double get paddingLeft => MediaQuery.of(this).padding.left;
  double get paddingBottom => MediaQuery.of(this).padding.bottom;
  double get paddingRight => MediaQuery.of(this).padding.right;
  double get screenHeightWithoutSystemBars =>
      MediaQuery.of(this).size.height -
      MediaQuery.of(this).padding.top -
      MediaQuery.of(this).padding.bottom;
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;
  bool get isTabletSize => MediaQuery.of(this).size.shortestSide >= 600;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
