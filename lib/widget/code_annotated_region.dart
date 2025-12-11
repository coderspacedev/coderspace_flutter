import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Enum to define status bar theme.
/// - [light]: light content (white icons/text)
/// - [dark]: dark content (black icons/text)
enum StatusBarTheme { light, dark }

/// A widget that wraps [AnnotatedRegion] to control the system status bar and navigation bar style.
///
/// This allows you to easily switch between light and dark status bar themes.
class CodeAnnotatedRegion extends StatelessWidget {
  /// The child widget over which the system UI style will be applied.
  final Widget child;

  /// The theme of the status bar.
  /// Defaults to [StatusBarTheme.light].
  final StatusBarTheme theme;

  /// Creates a widget that sets system UI overlay styles for its [child].
  const CodeAnnotatedRegion({super.key, required this.child, this.theme = StatusBarTheme.light});

  @override
  Widget build(BuildContext context) {
    /// Determine the appropriate SystemUiOverlayStyle based on the [theme].
    final style = theme == StatusBarTheme.light
        ? const SystemUiOverlayStyle(
            /// Transparent status bar background
            statusBarColor: Colors.transparent,

            /// Android: white status bar icons for light content
            statusBarIconBrightness: Brightness.light,

            /// iOS: white status bar text/icons for light content
            statusBarBrightness: Brightness.dark,

            /// Navigation bar background color
            systemNavigationBarColor: Colors.black,

            /// Navigation bar icon brightness
            systemNavigationBarIconBrightness: Brightness.light,
          )
        : const SystemUiOverlayStyle(
            /// Transparent status bar background
            statusBarColor: Colors.transparent,

            /// Android: dark status bar icons for dark content
            statusBarIconBrightness: Brightness.dark,

            /// iOS: dark status bar text/icons for dark content
            statusBarBrightness: Brightness.light,

            /// Navigation bar background color
            systemNavigationBarColor: Colors.white,

            /// Navigation bar icon brightness
            systemNavigationBarIconBrightness: Brightness.dark,
          );

    /// Wrap the child widget with AnnotatedRegion to apply the system UI style.
    return AnnotatedRegion<SystemUiOverlayStyle>(value: style, child: child);
  }
}
