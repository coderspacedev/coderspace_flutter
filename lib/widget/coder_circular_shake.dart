import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

/// A widget that applies a circular shaking animation to its [child].
///
/// This is useful for drawing user attention to a widget with a subtle
/// and short circular "wobble" animation.
///
/// Example usage:
/// ```dart
/// CoderCircularShake(
///   duration: Duration(milliseconds: 800),
///   child: Icon(Icons.campaign, color: Colors.red),
/// )
/// ```
class CoderCircularShake extends StatefulWidget {
  /// The widget to apply the shake animation to.
  final Widget child;

  /// Duration for how long the shake animation should play once started.
  ///
  /// Defaults to 700 milliseconds.
  final Duration duration;

  /// Creates a circular shaking animation around the widget.
  ///
  /// Starts the animation automatically after 600ms delay, runs for [duration], then stops.
  const CoderCircularShake({
    super.key,
    required this.child, // ✅ Required: Widget to shake
    this.duration = const Duration(milliseconds: 700), // Optional: How long the shaking lasts
  });

  @override
  State<CoderCircularShake> createState() => _CoderCircularShakeState();
}

class _CoderCircularShakeState extends State<CoderCircularShake>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// The radius of the circular shake path in logical pixels.
  static const double radius = 7.0;

  /// The speed multiplier for rotation in the circular path.
  static const double speed = 10.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    // Delayed start of shake animation
    Future.delayed(const Duration(milliseconds: 600), () {
      if (!mounted) return;

      _controller.repeat();

      // Stop animation after given duration
      Future.delayed(widget.duration, () {
        _controller.stop();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Calculates the offset in a circular path for a given animation value.
  Offset _getOffset(double value) {
    final angle = value * 2 * pi * speed;
    return Offset(cos(angle) * radius, sin(angle) * radius);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) => Transform.translate(
        offset: _getOffset(_controller.value),
        child: child,
      ),
      child: widget.child,
    );
  }
}

