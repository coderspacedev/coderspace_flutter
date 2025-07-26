import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class CoderCircularShake extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const CoderCircularShake({
    super.key,
    required this.child, // ✅ Required: Widget to shake
    this.duration = const Duration(milliseconds: 700), // Optional: Duration to keep shaking (default: 700ms)
  });

  @override
  State<CoderCircularShake> createState() => _CoderCircularShakeState();
}

class _CoderCircularShakeState extends State<CoderCircularShake> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static const double radius = 7.0;
  static const double speed = 10.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    Future.delayed(const Duration(milliseconds: 600), () async {
      if (!mounted) return;
      _controller.repeat();
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

  Offset _getOffset(double value) {
    final angle = value * 2 * pi * speed;
    return Offset(cos(angle) * radius, sin(angle) * radius);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder:
          (_, child) => Transform.translate(
            offset: _getOffset(_controller.value),
            child: child,
          ),
      child: widget.child,
    );
  }
}
