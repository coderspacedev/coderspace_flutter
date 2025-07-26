import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoderShakingIcon extends StatefulWidget {
  final String? svgAssetPath;
  final String? imageAssetPath;
  final IconData? iconData;
  final Color? color;
  final double size;
  final Duration duration;
  final double shakeOffset;
  final Axis shakeDirection;
  final BlendMode blendMode;

  const CoderShakingIcon({
    super.key,
    this.svgAssetPath, // ✅ Optional: SVG asset path (requires flutter_svg)
    this.imageAssetPath, // ✅ Optional: Image asset path (e.g., PNG/JPG)
    this.iconData, // ✅ Optional: Flutter built-in IconData
    this.color, // Optional: Color to apply to the icon/image/SVG
    this.size = 24, // Optional: Size of the icon/image in logical pixels
    this.duration = const Duration(milliseconds: 600), // Optional: One full shake cycle duration
    this.shakeOffset = 4.0, // Optional: Max distance to move during shake
    this.shakeDirection = Axis.horizontal, // Optional: Shake along horizontal or vertical axis
    this.blendMode = BlendMode.srcIn, // Optional: Blend mode for SVG or image color filter
  }) : assert(svgAssetPath != null || imageAssetPath != null || iconData != null, 'Provide either svgAssetPath, imageAssetPath, or iconData.');

  @override
  State<CoderShakingIcon> createState() => _CoderShakingIconState();
}

class _CoderShakingIconState extends State<CoderShakingIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shake;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)..repeat();

    final offset = widget.shakeOffset;

    _shake = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -offset), weight: 1),
      TweenSequenceItem(
        tween: Tween(begin: -offset, end: offset),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween(begin: offset, end: -offset),
        weight: 2,
      ),
      TweenSequenceItem(tween: Tween(begin: -offset, end: 0.0), weight: 1),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildChild() {
    if (widget.svgAssetPath != null) {
      return SvgPicture.asset(
        widget.svgAssetPath!,
        width: widget.size,
        height: widget.size,
        colorFilter: widget.color != null ? ColorFilter.mode(widget.color!, widget.blendMode) : null,
      );
    } else if (widget.imageAssetPath != null) {
      return Image.asset(widget.imageAssetPath!, width: widget.size, height: widget.size, color: widget.color, colorBlendMode: widget.blendMode);
    } else if (widget.iconData != null) {
      return Icon(widget.iconData, size: widget.size, color: widget.color);
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shake,
      builder: (context, child) {
        final dx = widget.shakeDirection == Axis.horizontal ? _shake.value : 0.0;
        final dy = widget.shakeDirection == Axis.vertical ? _shake.value : 0.0;
        return Transform.translate(offset: Offset(dx, dy), child: child);
      },
      child: _buildChild(),
    );
  }
}
