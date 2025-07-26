import 'package:coderspace/coderspace.dart';
import 'package:flutter/material.dart';

/// Types of snackbars used to indicate different states or messages.
enum SnackBarType { success, error, info, warning }

/// Extension on [BuildContext] to easily show styled snackbars based on [SnackBarType].
///
/// Example usage:
/// ```dart
/// context.showSnackBar('Operation successful', type: SnackBarType.success);
/// ```
extension SnackBarExtension on BuildContext {
  /// Displays a customizable [SnackBar] with type-based styling.
  ///
  /// - [message]: The main text message shown in the snackbar.
  /// - [type]: Type of snackbar ([SnackBarType.success], [SnackBarType.error], etc.)
  ///           which determines the color and default icon.
  /// - [duration]: Optional duration of the snackbar (default is 3 seconds).
  /// - [title]: Optional title to show above the message.
  /// - [icon]: Optional icon to override the default icon for each type.
  void showSnackBar(
    String message, {
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
    String? title,
    IconData? icon,
  }) {
    // Set background color and default icon based on type
    Color backgroundColor;
    IconData defaultIcon;

    switch (type) {
      case SnackBarType.success:
        backgroundColor = Colors.green;
        defaultIcon = Icons.check_circle;
        break;
      case SnackBarType.error:
        backgroundColor = Colors.red;
        defaultIcon = Icons.error;
        break;
      case SnackBarType.warning:
        backgroundColor = Colors.orange;
        defaultIcon = Icons.warning;
        break;
      case SnackBarType.info:
        backgroundColor = Colors.blue;
        defaultIcon = Icons.info;
        break;
    }

    // Clear any existing snackbars before showing a new one
    ScaffoldMessenger.of(this).clearSnackBars();

    // Show the snackbar
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        duration: duration,
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        content: Row(
          children: [
            Icon(icon ?? defaultIcon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Text(
                      title,
                      style: bodyBoldLarge.copyWith(color: Colors.white),
                    ),
                  Text(message, style: caption.copyWith(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
