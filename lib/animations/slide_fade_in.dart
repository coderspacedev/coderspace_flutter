import 'package:flutter/material.dart';

/// A widget that combines a slide-in and fade-in animation when it appears.
///
/// Useful for animating list items, banners, or any content that should
/// enter the screen with a smooth transition.
class SlideFadeIn extends StatefulWidget {
  /// The widget to animate.
  final Widget child;

  /// The direction from which the widget will slide in.
  final Offset beginOffset;

  /// Animation duration.
  final Duration duration;

  /// Delay before the animation starts.
  final Duration delay;

  /// The animation curve.
  final Curve curve;

  const SlideFadeIn({
    super.key,
    required this.child,
    this.beginOffset = const Offset(
      0.0,
      0.1,
    ), // default: slide up from 10% height
    this.duration = const Duration(milliseconds: 500),
    this.delay = Duration.zero,
    this.curve = Curves.easeOut,
  });

  @override
  State<SlideFadeIn> createState() => _SlideFadeInState();
}

class _SlideFadeInState extends State<SlideFadeIn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(vsync: this, duration: widget.duration);

    // Tween for slide animation
    _offsetAnimation = Tween<Offset>(
      begin: widget.beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    // Tween for fade animation
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    // Start animation with optional delay
    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose(); // Cleanup controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(position: _offsetAnimation, child: widget.child),
    );
  }
}
