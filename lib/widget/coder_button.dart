import 'package:flutter/material.dart';
import 'package:coderspace/coderspace.dart';

/// A highly customizable button widget with optional loading state,
/// icon, padding, border radius, and style overrides.
///
/// Example usage:
/// ```dart
/// CoderButton(
///   text: 'Submit',
///   onPressed: () => print('Submitted!'),
///   icon: Icon(Icons.send),
///   isLoading: false,
///   backgroundColor: Colors.blue,
///   textColor: Colors.white,
/// )
/// ```
class CoderButton extends StatelessWidget {
  /// Button label text (required).
  final String text;

  /// Callback when the button is tapped.
  final Function()? onPressed;

  /// Optional background color of the button. Defaults to [colorAccent].
  final Color? backgroundColor;

  /// Optional text color. Defaults to [colorAccentText].
  final Color? textColor;

  /// Height of the button. Defaults to `context.scale(48)`.
  final double? height;

  /// Width of the button. If null, button expands based on content.
  final double? width;

  /// Circular radius if [borderRadius] is not provided.
  final double? radius;

  /// Full border radius. Takes priority over [radius] if set.
  final BorderRadius? borderRadius;

  /// Horizontal padding inside the button content.
  final double? paddingH;

  /// Vertical padding inside the button content.
  final double? paddingV;

  /// Text style override.
  final TextStyle? style;

  /// Whether to show a loading spinner instead of content.
  final bool isLoading;

  /// Optional icon shown before the text.
  final Widget? icon;

  /// Creates a [CoderButton] with customizable design and state.
  const CoderButton({
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
              shape: RoundedRectangleBorder(
                borderRadius:
                    borderRadius ??
                    BorderRadius.circular(radius ?? context.scale(12)),
              ),
              elevation: 0,
              padding: EdgeInsets.symmetric(
                horizontal: paddingH ?? 0,
                vertical: paddingV ?? 0,
              ),
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
                child: CircularProgressIndicator(
                  strokeWidth: context.scale(2),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    textColor ?? colorAccentText,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    ?icon,
                    SizedBox(width: context.scale(8)),
                  ],
                  Flexible(
                    child: Text(
                      text,
                      overflow: TextOverflow.ellipsis,
                      style:
                          style ??
                          context.button.copyWith(
                            color: textColor ?? colorAccentText,
                          ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
