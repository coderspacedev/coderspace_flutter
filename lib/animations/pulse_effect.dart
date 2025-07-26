import 'package:flutter/material.dart';

/// Creates a pulsing scale effect by repeatedly expanding and shrinking the child.
///
/// Great for drawing attention to FABs, icons, avatars, etc.
class PulseEffect extends StatefulWidget {
  /// The widget to animate.
  final Widget child;

  /// Minimum scale factor (e.g., 0.9).
  final double minScale;

  /// Maximum scale factor (e.g., 1.1).
  final double maxScale;

  /// Duration of one pulse (scale up + down).
  final Duration duration;

  /// Whether the animation should start automatically.
  final bool autoStart;

  const PulseEffect({
    super.key,
    required this.child,
    this.minScale = 0.95,
    this.maxScale = 1.05,
    this.duration = const Duration(milliseconds: 800),
    this.autoStart = true,
  });

  @override
  State<PulseEffect> createState() => _PulseEffectState();
}

class _PulseEffectState extends State<PulseEffect>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Set up animation controller
    _controller = AnimationController(vsync: this, duration: widget.duration);

    // Repeats the pulse back and forth
    _scaleAnimation = Tween<double>(
      begin: widget.minScale,
      end: widget.maxScale,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (widget.autoStart) {
      _controller.repeat(reverse: true);
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
