import 'package:flutter/material.dart';

/// A simple shimmer loading placeholder effect using animated gradient.
///
/// Wrap any widget or use standalone for skeleton loaders.
class ShimmerPlaceholder extends StatefulWidget {
  /// Width of the shimmer placeholder.
  final double? width;

  /// Height of the shimmer placeholder.
  final double? height;

  /// Border radius for rounding.
  final BorderRadius borderRadius;

  /// Base color (static background).
  final Color baseColor;

  /// Highlight color (shimmer stroke).
  final Color highlightColor;

  /// Shimmer animation duration.
  final Duration duration;

  const ShimmerPlaceholder({
    super.key,
    this.width,
    this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  State<ShimmerPlaceholder> createState() => _ShimmerPlaceholderState();
}

class _ShimmerPlaceholderState extends State<ShimmerPlaceholder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, _) {
        return ShaderMask(
          shaderCallback: (bounds) {
            final shimmerWidth = bounds.width * 1.5;
            final dx = shimmerWidth * _controller.value - shimmerWidth / 2;

            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                widget.baseColor,
                widget.highlightColor,
                widget.baseColor,
              ],
              stops: const [0.1, 0.5, 0.9],
              transform: GradientTranslation(dx),
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.baseColor,
              borderRadius: widget.borderRadius,
            ),
          ),
        );
      },
    );
  }
}

/// A custom transform class to slide the shimmer gradient horizontally.
class GradientTranslation extends GradientTransform {
  final double dx;

  const GradientTranslation(this.dx);

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(dx, 0, 0);
  }
}
