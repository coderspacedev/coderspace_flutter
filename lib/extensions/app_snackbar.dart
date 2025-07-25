import 'package:coderspace/coderspace.dart';
import 'package:flutter/material.dart';

enum SnackBarType { success, error, info, warning }

extension SnackBarExtension on BuildContext {
  void showSnackBar(
    String message, {
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
    String? title,
    IconData? icon,
  }) {
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

    ScaffoldMessenger.of(this).clearSnackBars();
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
