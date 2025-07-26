import 'package:flutter/cupertino.dart';

/// A container that renders a sweep gradient with dynamic rotation angle and rounded corners.
///
/// Typically used inside [CoderAnimatedGradientBorder] to animate gradient motion.
class CoderAnimatedGradientContainer extends StatelessWidget {
  /// Creates a [CoderAnimatedGradientContainer].
  ///
  /// [gradientColors], [gradientAngle], and [borderRadius] must not be null.
  const CoderAnimatedGradientContainer({
    super.key,

    /// The list of colors to use for the animated gradient.
    required this.gradientColors,

    /// The current rotation angle of the gradient in radians.
    ///
    /// Can be animated to create a rotating effect.
    required this.gradientAngle,

    /// The corner radius of the container.
    required this.borderRadius,
  });

  /// The base colors used in the animated gradient.
  ///
  /// The colors are mirrored (reversed and appended) to create a seamless loop.
  final List<Color> gradientColors;

  /// The rotation angle of the sweep gradient in radians.
  final double gradientAngle;

  /// The border radius of the container.
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: SweepGradient(
          colors: [...gradientColors, ...gradientColors.reversed],
          stops: _generateColorStops([
            ...gradientColors,
            ...gradientColors.reversed,
          ]),
          transform: GradientRotation(gradientAngle),
        ),
      ),
    );
  }

  /// Generates evenly spaced color stops based on the number of colors.
  ///
  /// This ensures a smooth transition around the full gradient circle.
  List<double> _generateColorStops(List<dynamic> colors) {
    return colors.asMap().entries.map((entry) {
      double percentageStop = entry.key / colors.length;
      return percentageStop;
    }).toList();
  }
}
