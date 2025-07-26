import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'coder_animated_gradient_container.dart';

/// A glowing, animated gradient border that wraps a child widget.
///
/// The [CoderAnimatedGradientBorder] widget animates a sweep gradient
/// around its child with an optional glowing blur effect and customizable
/// rotation speed, border thickness, and axis stretching.
class CoderAnimatedGradientBorder extends StatefulWidget {
  /// The widget to display inside the animated border.
  final Widget child;

  /// The colors to animate in the rotating gradient.
  final List<Color> gradientColors;

  /// The radius of the border corners.
  final BorderRadiusGeometry borderRadius;

  /// The thickness of the animated border. Default is `null` (no border).
  final double? borderSize;

  /// The size of the glow effect around the border. Default is `null` (no glow).
  final double? glowSize;

  /// The duration (in seconds) of a full 360° rotation animation.
  ///
  /// If `null`, defaults to `2` seconds.
  final int? animationTime;

  /// Manually control the animation's progress, from `0.0` to `1.0`.
  ///
  /// If `null`, the animation loops continuously.
  final double? animationProgress;

  /// Whether to stretch the child widget to fill the specified [stretchAxis].
  final bool stretchAlongAxis;

  /// The axis to stretch if [stretchAlongAxis] is true.
  ///
  /// Default is [Axis.horizontal].
  final Axis stretchAxis;

  /// Creates a glowing animated gradient border around the [child].
  ///
  /// Requires [gradientColors] and [borderRadius] to be provided.
  const CoderAnimatedGradientBorder({
    super.key,
    required this.child,
    required this.gradientColors,
    required this.borderRadius,
    this.animationTime,
    this.borderSize,
    this.glowSize,
    this.animationProgress,
    this.stretchAlongAxis = false,
    this.stretchAxis = Axis.horizontal,
  });

  @override
  State<StatefulWidget> createState() => AnimatedGradientState();
}

/// The [State] implementation for [CoderAnimatedGradientBorder].
class AnimatedGradientState extends State<CoderAnimatedGradientBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _angleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.animationTime ?? 2),
    );
    _controller.addListener(() => setState(() {}));
    _angleAnimation = Tween<double>(
      begin: 0.1,
      end: 2 * math.pi,
    ).animate(_controller);

    if (widget.animationProgress != null) {
      _controller.forward();
    } else {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CoderAnimatedGradientBorder oldWidget) {
    super.didUpdateWidget(oldWidget);
    final animateTo = widget.animationProgress;
    if (animateTo != null) {
      _controller.animateTo(animateTo);
    } else {
      _controller.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    final negativeMargin = -1.0 * (widget.borderSize ?? 0);
    return Container(
      padding: EdgeInsets.all(
        (widget.glowSize ?? 5) * 3 + (widget.borderSize ?? 0) * 3,
      ),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: widget.borderRadius),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // Outer animated gradient layer (background border)
          Positioned(
            top: negativeMargin,
            left: negativeMargin,
            right: negativeMargin,
            bottom: negativeMargin,
            child: CoderAnimatedGradientContainer(
              gradientColors: widget.gradientColors,
              borderRadius: widget.borderRadius,
              gradientAngle: _angleAnimation.value,
            ),
          ),

          // Blur glow effect layer
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: widget.glowSize ?? 0,
              sigmaY: widget.glowSize ?? 0,
            ),
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                // Foreground animated gradient layer
                Positioned(
                  top: negativeMargin,
                  right: negativeMargin,
                  left: negativeMargin,
                  bottom: negativeMargin,
                  child: CoderAnimatedGradientContainer(
                    gradientColors: widget.gradientColors,
                    borderRadius: widget.borderRadius,
                    gradientAngle: _angleAnimation.value,
                  ),
                ),

                // Wrapped child widget
                if (widget.stretchAlongAxis)
                  SizedBox(
                    width: widget.stretchAxis == Axis.horizontal
                        ? double.infinity
                        : null,
                    height: widget.stretchAxis == Axis.vertical
                        ? double.infinity
                        : null,
                    child: widget.child,
                  )
                else
                  widget.child,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
