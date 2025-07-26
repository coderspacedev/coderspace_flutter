import 'package:flutter/material.dart';

/// A customizable animation widget that provides a bounce effect on tap.
///
/// [BounceTap] scales down the child widget when tapped and
/// bounces it back to original size upon release. It's commonly used to
/// enhance tap feedback on buttons, icons, and interactive components.
class BounceTap extends StatefulWidget {
  /// The widget to animate.
  final Widget child;

  /// Callback when the widget is tapped.
  final VoidCallback? onTap;

  /// Duration of the bounce animation.
  final Duration duration;

  /// Scale factor when the widget is pressed.
  /// For example, 0.9 will scale the widget down to 90% of its size.
  final double scale;

  const BounceTap({
    super.key,
    required this.child,
    this.onTap,
    this.duration = const Duration(milliseconds: 150),
    this.scale = 0.9,
  });

  @override
  State<BounceTap> createState() => _BounceTapState();
}

class _BounceTapState extends State<BounceTap>
    with SingleTickerProviderStateMixin {
  // Controller that drives the scale animation.
  late final AnimationController _controller = AnimationController(
    duration: widget.duration,
    vsync: this,
    lowerBound: widget.scale,
    upperBound: 1.0,
  );

  @override
  void initState() {
    super.initState();
    // Start with full scale (no animation applied).
    _controller.value = 1.0;
  }

  @override
  void dispose() {
    // Always dispose the controller to free resources.
    _controller.dispose();
    super.dispose();
  }

  /// Resets the scale back to original when tap is released or cancelled.
  void _reset() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Scale down when the user taps down.
      onTapDown: (_) => _controller.reverse(),

      // Scale back up when the user lifts their finger.
      onTapUp: (_) => _reset(),

      // Also reset if the tap is cancelled (e.g., dragged away).
      onTapCancel: _reset,

      // Call the provided onTap callback, if any.
      onTap: widget.onTap,

      // Wrap the child in a scale transition driven by the controller.
      child: ScaleTransition(scale: _controller, child: widget.child),
    );
  }
}
