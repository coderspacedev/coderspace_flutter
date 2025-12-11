import 'package:coderspace/coderspace.dart';
import 'package:flutter/material.dart';

/// Types of snackbars used to indicate different states or messages.
enum SnackBarType { success, error, info, warning, defaultMode }

/// Extension on [BuildContext] to easily show styled snackbars based on [SnackBarType].
///
/// Example usage:
/// ```dart
/// context.showSnackBar('Operation successful', type: SnackBarType.success);
/// ```
extension SnackBarExtension on BuildContext {
  /// Shows a clean floating snackbar with optional overrides.
  ///
  /// - [message] → Text displayed
  /// - [type] → Controls default color set
  /// - [backgroundColor] → Manually override background (optional)
  /// - [textColor] → Manually override text color (optional)
  /// - [duration] → Duration to display
  void showSnack(
    String message, {
    SnackBarType type = SnackBarType.defaultMode,
    Color? backgroundColor,
    Color? textColor,
    Duration duration = const Duration(seconds: 1),
  }) {
    final messenger = ScaffoldMessenger.maybeOf(this);

    if (messenger == null) {
      debugPrint("⚠️ ScaffoldMessenger not found, snackbar cannot be shown.");
      return;
    }

    // Default color set for each type
    final defaultBackground = {
      SnackBarType.success: Colors.green,
      SnackBarType.error: Colors.red,
      SnackBarType.warning: Colors.orange,
      SnackBarType.info: Colors.blue,
      SnackBarType.defaultMode: Colors.black54,
    }[type];

    // Final chosen background
    final bg = backgroundColor ?? defaultBackground;

    // Text color depending on contrast
    final fg = textColor ?? Colors.white;

    messenger.clearSnackBars();

    messenger.showSnackBar(
      SnackBar(
        duration: duration,
        behavior: SnackBarBehavior.floating,
        backgroundColor: bg,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Text(
          message,
          style: bodyMedium.copyWith(color: fg), // your custom style
        ),
      ),
    );
  }
}
