import 'package:flutter/material.dart';
import 'package:coderspace/coderspace.dart';

class AppContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxDecoration? decoration;
  final Color? color;
  final double? radius;
  final Alignment? alignment;

  const AppContainer({
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
