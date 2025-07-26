import 'package:flutter/material.dart';
import 'package:coderspace/coderspace.dart';

/// A customizable container widget with optional padding, margin,
/// width, height, color, border radius, alignment, and decoration.
///
/// This is a convenience wrapper over [Container] with sensible defaults
/// and scaling support via `context.scale(...)`.
class CoderContainer extends StatelessWidget {
  /// The widget below this container in the widget tree.
  final Widget? child;

  /// The container’s width. If null, the container will size to its child.
  final double? width;

  /// The container’s height. If null, the container will size to its child.
  final double? height;

  /// Empty space to inscribe inside the container. The child, if any, is
  /// placed inside this padding.
  final EdgeInsets? padding;

  /// Empty space to surround the container.
  final EdgeInsets? margin;

  /// The decoration to paint behind the [child].
  ///
  /// If [decoration] is null, a [BoxDecoration] is used with the specified
  /// [color] and [radius]. If both are null, defaults are applied.
  final BoxDecoration? decoration;

  /// The background color of the container (used only if [decoration] is null).
  final Color? color;

  /// The border radius of the container (used only if [decoration] is null).
  ///
  /// Defaults to `context.scale(12)` if not specified.
  final double? radius;

  /// Align the child within the container.
  final Alignment? alignment;

  /// Creates a [CoderContainer].
  ///
  /// This widget simplifies applying common container styling options.
  const CoderContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.decoration,
    this.color,
    this.radius,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration:
          decoration ??
          BoxDecoration(
            color: color ?? colorCard,
            borderRadius: BorderRadius.circular(radius ?? context.scale(12)),
          ),
      child: child,
    );
  }
}
