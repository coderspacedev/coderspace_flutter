import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A widget that displays a shaking icon or image (SVG, raster, or IconData).
///
/// You can provide one of the following:
/// - [svgAssetPath] for an SVG image (requires `flutter_svg`)
/// - [imageAssetPath] for a raster image (e.g., PNG, JPG)
/// - [iconData] for a standard Flutter icon
///
/// The icon/image will continuously shake along the given axis using
/// the configured shake offset and animation duration.
class CoderShakingIcon extends StatefulWidget {
  /// The path to the SVG asset to render.
  ///
  /// Requires the `flutter_svg` package. Ignored if null.
  final String? svgAssetPath;

  /// The path to the image asset to render (e.g., PNG/JPG).
  ///
  /// Ignored if null.
  final String? imageAssetPath;

  /// The Flutter [IconData] to render.
  ///
  /// Ignored if null.
  final IconData? iconData;

  /// The color to apply to the icon, SVG, or image.
  ///
  /// If null, defaults to the asset's original color.
  final Color? color;

  /// The size of the icon/image in logical pixels.
  ///
  /// Defaults to `24.0`.
  final double size;

  /// The duration for one complete shake animation cycle.
  ///
  /// Defaults to 600 milliseconds.
  final Duration duration;

  /// The maximum distance (in pixels) the icon will move during the shake.
  ///
  /// Defaults to `4.0`.
  final double shakeOffset;

  /// The direction of the shake animation.
  ///
  /// Can be [Axis.horizontal] or [Axis.vertical]. Defaults to horizontal.
  final Axis shakeDirection;

  /// The blend mode used when applying color to SVG or images.
  ///
  /// Defaults to [BlendMode.srcIn].
  final BlendMode blendMode;

  /// Creates a [CoderShakingIcon] widget.
  ///
  /// You must provide at least one of [svgAssetPath], [imageAssetPath],
  /// or [iconData], otherwise an [AssertionError] will be thrown.
  const CoderShakingIcon({
    super.key,
    this.svgAssetPath, // ✅ Optional: SVG asset path (requires flutter_svg)
    this.imageAssetPath, // ✅ Optional: Image asset path (e.g., PNG/JPG)
    this.iconData, // ✅ Optional: Flutter built-in IconData
    this.color, // Optional: Color to apply to the icon/image/SVG
    this.size = 24, // Optional: Size of the icon/image in logical pixels
    this.duration = const Duration(
      milliseconds: 600,
    ), // Optional: One full shake cycle duration
    this.shakeOffset = 4.0, // Optional: Max distance to move during shake
    this.shakeDirection =
        Axis.horizontal, // Optional: Shake along horizontal or vertical axis
    this.blendMode =
        BlendMode.srcIn, // Optional: Blend mode for SVG or image color filter
  }) : assert(
         svgAssetPath != null || imageAssetPath != null || iconData != null,
         'Provide either svgAssetPath, imageAssetPath, or iconData.',
       );

  @override
  State<CoderShakingIcon> createState() => _CoderShakingIconState();
}

class _CoderShakingIconState extends State<CoderShakingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shake;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();

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
        widget.svgAssetPath ?? '',
        width: widget.size,
        height: widget.size,
        colorFilter: widget.color != null
            ? ColorFilter.mode(widget.color??Colors.black, widget.blendMode)
            : null,
      );
    } else if (widget.imageAssetPath != null) {
      return Image.asset(
        widget.imageAssetPath ?? '',
        width: widget.size,
        height: widget.size,
        color: widget.color,
        colorBlendMode: widget.blendMode,
      );
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
        final dx = widget.shakeDirection == Axis.horizontal
            ? _shake.value
            : 0.0;
        final dy = widget.shakeDirection == Axis.vertical ? _shake.value : 0.0;
        return Transform.translate(offset: Offset(dx, dy), child: child);
      },
      child: _buildChild(),
    );
  }
}
