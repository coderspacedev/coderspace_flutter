import 'package:flutter/material.dart';

/// A widget that reveals its child using a scale or circular clipping effect.
///
/// Commonly used for onboarding steps, hero transitions, or attention-grabbing animations.
class RevealAnimation extends StatefulWidget {
  /// The child widget to reveal.
  final Widget child;

  /// Duration of the reveal animation.
  final Duration duration;

  /// Starting scale (0.0 means invisible).
  final double startScale;

  /// Ending scale (1.0 is full size).
  final double endScale;

  /// Delay before the reveal starts.
  final Duration delay;

  /// Reveal animation curve.
  final Curve curve;

  /// Optional callback when the animation completes.
  final VoidCallback? onCompleted;

  const RevealAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.startScale = 0.0,
    this.endScale = 1.0,
    this.delay = Duration.zero,
    this.curve = Curves.easeOutBack,
    this.onCompleted,
  });

  @override
  State<RevealAnimation> createState() => _RevealAnimationState();
}

class _RevealAnimationState extends State<RevealAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: widget.duration, vsync: this);

    _scaleAnimation = Tween<double>(
      begin: widget.startScale,
      end: widget.endScale,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    if (widget.delay == Duration.zero) {
      _controller.forward().then((_) => widget.onCompleted?.call());
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) {
          _controller.forward().then((_) => widget.onCompleted?.call());
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _scaleAnimation, child: widget.child);
  }
}
