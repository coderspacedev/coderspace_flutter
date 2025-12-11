import 'package:coderspace/coderspace.dart';
import 'package:flutter/material.dart';

/// Extension on [num] to provide easy scaling utilities for responsive UI.
extension NumScaleExtension on num {
  /// Scales the number based on screen width using the context's [scale] method.
  ///
  /// Example:
  /// ```dart
  /// double width = 12.scale(context);
  /// ```
  double scale(BuildContext context) => context.scale(toDouble());

  /// Short alias for [scale]. Scales based on screen width.
  ///
  /// Example:
  /// ```dart
  /// double width = 12.s(context);
  /// ```
  double s(BuildContext context) => context.scale(toDouble());

  /// Scales the number based on both screen width and height using [scaleBoth].
  ///
  /// Example:
  /// ```dart
  /// double size = 12.scaleBoth(context);
  /// ```
  double scaleBoth(BuildContext context) => context.scaleBoth(toDouble());

  /// Short alias for [scaleBoth]. Scales based on both width and height.
  ///
  /// Example:
  /// ```dart
  /// double size = 12.sb(context);
  /// ```
  double sb(BuildContext context) => context.scaleBoth(toDouble());
}

