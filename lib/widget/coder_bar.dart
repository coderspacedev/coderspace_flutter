import 'package:flutter/material.dart';
import 'package:coderspace/coderspace.dart';

class CoderBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final double? elevation;
  final double? toolbarHeight;
  final double? titleSpacing;
  final TextStyle? titleStyle;
  final List<Widget>? actions;
  final bool isBack;
  final bool centerTitle;
  final VoidCallback? onBack;
  final bool forceMaterialTransparency;
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;

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
    this.isBack = true,
    this.centerTitle = false,
    this.onBack,
    this.forceMaterialTransparency = true,
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
      toolbarHeight: toolbarHeight ?? (context.isTabletSize
          ?  100.0 : 56.0),
      leading:
      isBack
          ? IconButton(
        onPressed: onBack ?? () => Navigator.of(context).pop(),
        icon: Icon(
          icon ?? Icons.arrow_back_rounded,
          size: context.scale(24),
          color: iconColor ?? colorText,
        ),
        padding: EdgeInsets.zero,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      )
          : null,
      title:
      title != null
          ? Padding(
        padding: EdgeInsets.only(
          left: isBack ? context.scale(4) : context.scale(16),
        ),
        child: Text(
          title!,
          style:
          titleStyle ??
              context.headline5.copyWith(
                color: textColor ?? colorText,
                fontWeight: FontWeight.w600,
              ),
        ),
      )
          : const SizedBox.shrink(),
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize {
    final shortestSide = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.shortestSide /
        WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

    final defaultToolbarHeight = toolbarHeight ??
        (shortestSide > 600 ? 100.0 : 56.0);

    return Size.fromHeight(defaultToolbarHeight + (bottom?.preferredSize.height ?? 0));
  }
}
