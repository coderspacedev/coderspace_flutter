import 'package:flutter/material.dart';
import 'package:coderspace/coderspace.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? radius;
  final BorderRadius? borderRadius;
  final double? paddingH;
  final double? paddingV;
  final TextStyle? style;
  final bool isLoading;
  final Widget? icon;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.width,
    this.radius,
    this.borderRadius,
    this.paddingH,
    this.paddingV,
    this.style,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? context.scale(48),
      width: width,
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? colorAccent,
              shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(radius ?? context.scale(12))),
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: paddingH ?? 0, vertical: paddingV ?? 0),
            ).copyWith(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              shadowColor: WidgetStateProperty.all(Colors.transparent),
              splashFactory: NoSplash.splashFactory,
            ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                width: context.scale(20),
                height: context.scale(20),
                child: CircularProgressIndicator(strokeWidth: context.scale(2), valueColor: AlwaysStoppedAnimation<Color>(textColor ?? colorAccentText)),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[icon!, SizedBox(width: context.scale(8))],
                  Flexible(
                    child: Text(
                      text,
                      overflow: TextOverflow.ellipsis,
                      style: style ?? context.button.copyWith(color: textColor ?? colorAccentText),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
