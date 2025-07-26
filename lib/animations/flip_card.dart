import 'package:flutter/material.dart';

/// A widget that flips between front and back content with a 3D rotation effect.
///
/// Supports horizontal or vertical flipping. Commonly used in cards, games, and profile UI.
class FlipCard extends StatefulWidget {
  /// The front side of the card.
  final Widget front;

  /// The back side of the card.
  final Widget back;

  /// Duration of the flip animation.
  final Duration duration;

  /// Flip direction (true = horizontal, false = vertical).
  final bool flipHorizontal;

  /// Whether to flip automatically or externally control it.
  final bool autoFlip;

  /// Initial state of the card (false = show front).
  final bool initiallyFlipped;

  const FlipCard({
    super.key,
    required this.front,
    required this.back,
    this.duration = const Duration(milliseconds: 600),
    this.flipHorizontal = true,
    this.autoFlip = true,
    this.initiallyFlipped = false,
  });

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late bool _isFront;

  @override
  void initState() {
    super.initState();
    _isFront = !widget.initiallyFlipped;

    _controller = AnimationController(duration: widget.duration, vsync: this);
    if (!_isFront) _controller.forward();
  }

  void _toggleCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() => _isFront = !_isFront);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildSide({required Widget child, required bool isFront}) {
    return IgnorePointer(
      ignoring: isFront ? !_isFront : _isFront,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          double angle = _controller.value * 3.1416; // π = 180°
          if (!isFront) angle += 3.1416;

          return Transform(
            transform: widget.flipHorizontal
                ? Matrix4.rotationY(angle)
                : Matrix4.rotationX(angle),
            alignment: Alignment.center,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.autoFlip ? _toggleCard : null,
      child: Stack(
        children: [
          _buildSide(child: widget.back, isFront: false),
          _buildSide(child: widget.front, isFront: true),
        ],
      ),
    );
  }
}
