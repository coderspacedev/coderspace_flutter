import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coderspace/coderspace.dart';

/// A fully customizable app bar supporting:
/// - custom leading widget
/// - auto iOS back button
/// - title as string or widget
/// - custom height, actions, and colors
class CoderBar extends StatelessWidget implements PreferredSizeWidget {
  /// Title text (optional if using [titleWidget])
  final String? title;

  /// Custom title widget (overrides [title])
  final Widget? titleWidget;

  /// Custom leading icon/widget
  final Widget? leading;

  /// Whether to show automatic back button
  final bool isBack;

  /// Background color
  final Color? backgroundColor;

  /// Title text color
  final Color? textColor;

  /// Back icon color
  final Color? iconColor;

  /// Elevation
  final double? elevation;

  /// Custom height
  final double? height;

  /// Center title
  final bool centerTitle;

  /// Whether to apply transparent background when scrolling. Defaults to `false`.
  final bool forceMaterialTransparency;

  /// If true, Flutter auto adds a back button when there's a Navigator ancestor.
  final bool automaticallyImplyLeading;

  /// Actions
  final List<Widget>? actions;

  /// Callback when back pressed
  final VoidCallback? onBack;

  /// Bottom widget (e.g., TabBar)
  final PreferredSizeWidget? bottom;

  /// Creates a flexible, themed app bar.
  const CoderBar({
    super.key,
    this.title,
    this.titleWidget,
    this.leading,
    this.isBack = false,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.elevation,
    this.height,
    this.centerTitle = false,
    this.forceMaterialTransparency = false,
    this.automaticallyImplyLeading = false,
    this.actions,
    this.onBack,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    final bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    /// Default leading for back button logic
    Widget? defaultLeading;
    if (isBack) {
      defaultLeading = IconButton(
        onPressed: onBack ?? () => Navigator.of(context).pop(),
        icon: isIOS
            ? Icon(
                CupertinoIcons.back,
                size: context.scaleBoth(24),
                color: iconColor ?? AppTheme.colors.text,
              )
            : Icon(
                Icons.arrow_back_rounded,
                size: context.scaleBoth(24),
                color: iconColor ?? AppTheme.colors.text,
              ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      );
    }

    /// Final leading: custom > back > none
    final leadingWidget = leading ?? defaultLeading;

    /// Build title: widget > text > none
    final Widget? finalTitle =
        titleWidget ??
        (title != null
            ? Text(
                title??'',
                style: context.headline5.copyWith(
                  color: textColor ?? AppTheme.colors.text,
                  fontWeight: FontWeight.w600,
                ),
              )
            : null);

    return AppBar(
      backgroundColor: backgroundColor ?? AppTheme.colors.background,
      elevation: elevation ?? 0,
      centerTitle: centerTitle,
      toolbarHeight: height ?? (context.isTabletSize ? 100 : 56),
      leading: leadingWidget,
      title: finalTitle,
      automaticallyImplyLeading: automaticallyImplyLeading,
      forceMaterialTransparency: forceMaterialTransparency,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight((height ?? 56) + (bottom?.preferredSize.height ?? 0));
}
