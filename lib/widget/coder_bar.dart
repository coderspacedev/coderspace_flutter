import 'package:flutter/material.dart';
import 'package:coderspace/coderspace.dart';

/// A customizable top app bar for Flutter apps, compatible with phones and tablets.
///
/// Supports optional back icon, title, styling, toolbar height, and a bottom widget.
///
/// Example usage:
/// ```dart
/// CoderBar(
///   title: 'Dashboard',
///   actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
/// )
/// ```
class CoderBar extends StatelessWidget implements PreferredSizeWidget {
  /// Optional title text to display in the center or start of the app bar.
  final String? title;

  /// Icon to use for the back button. Defaults to [Icons.arrow_back_rounded].
  final IconData? icon;

  /// Background color of the app bar. Defaults to [colorBackground].
  final Color? backgroundColor;

  /// Color of the back icon. Defaults to [colorText].
  final Color? iconColor;

  /// Color of the title text. Defaults to [colorText].
  final Color? textColor;

  /// Elevation of the app bar. Defaults to `0`.
  final double? elevation;

  /// Custom toolbar height. If not set, adjusts based on screen size.
  final double? toolbarHeight;

  /// Horizontal spacing before the title.
  final double? titleSpacing;

  /// Custom text style for the title. Defaults to `headline5` with weight 600.
  final TextStyle? titleStyle;

  /// Optional list of widgets displayed in the trailing action area.
  final List<Widget>? actions;

  /// Whether to show the back button. Defaults to `false`.
  final bool isBack;

  /// Whether to center the title. Defaults to `false`.
  final bool centerTitle;

  /// Callback triggered when back button is tapped. Defaults to `Navigator.pop()`.
  final VoidCallback? onBack;

  /// Whether to apply transparent background when scrolling. Defaults to `false`.
  final bool forceMaterialTransparency;

  /// If true, Flutter auto adds a back button when there's a Navigator ancestor.
  final bool automaticallyImplyLeading;

  /// A widget to display at the bottom of the app bar (like a tab bar).
  final PreferredSizeWidget? bottom;

  /// Creates a customizable app bar used across the app.
  const CoderBar({
    super.key,
    this.title,
    this.icon,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.elevation,
    this.toolbarHeight,
    this.titleSpacing,
    this.titleStyle,
    this.actions,
    this.isBack = false,
    this.centerTitle = false,
    this.onBack,
    this.forceMaterialTransparency = false,
    this.automaticallyImplyLeading = false,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation ?? 0,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? colorBackground,
      automaticallyImplyLeading: automaticallyImplyLeading,
      forceMaterialTransparency: forceMaterialTransparency,
      titleSpacing: titleSpacing ?? 0,
      toolbarHeight: toolbarHeight ?? (context.isTabletSize ? 100.0 : 56.0),
      leading: isBack
          ? IconButton(
              onPressed: onBack ?? () => Navigator.of(context).pop(),
              icon: Icon(icon ?? Icons.arrow_back_rounded, size: context.scale(24), color: iconColor ?? colorText),
              padding: EdgeInsets.zero,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            )
          : null,
      title: title != null
          ? Padding(
              padding: EdgeInsets.only(
                left: isBack
                    ? context.scale(4)
                    : centerTitle
                    ? context.scale(0)
                    : context.scale(16),
              ),
              child: Text(
                title ?? '',
                style: titleStyle ?? context.headline5.copyWith(color: textColor ?? colorText, fontWeight: FontWeight.w600),
              ),
            )
          : const SizedBox.shrink(),
      actions: actions,
      bottom: bottom,
    );
  }

  /// Calculates the preferred height of the app bar depending on device size.
  @override
  Size get preferredSize {
    final shortestSide =
        WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.shortestSide /
        WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

    final defaultToolbarHeight = toolbarHeight ?? (shortestSide > 600 ? 100.0 : 56.0);

    return Size.fromHeight(defaultToolbarHeight + (bottom?.preferredSize.height ?? 0));
  }
}
