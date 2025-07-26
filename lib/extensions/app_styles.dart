import 'package:coderspace/coderspace.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Extension to provide responsive text styles and scaled sizing for different screen widths.
///
/// It uses [GoogleFonts.poppins] as the base font and scales sizes depending on device width:
/// - width ≥ 1024 → scale 1.6
/// - width ≥ 768  → scale 1.35
/// - width < 768  → scale 1.0
extension AppStyles on BuildContext {
  /// Scales a given [size] based on screen width.
  double scale(double size) => size * _scale;

  /// Internal scale factor based on screen width.
  double get _scale {
    double width = MediaQuery.of(this).size.width;
    if (width >= 1024) return 1.6;
    if (width >= 768) return 1.35;
    return 1.0;
  }

  /// Builds the base [TextStyle] using [GoogleFonts.poppins].
  ///
  /// [fontSize]: base font size before scaling.
  /// [fontWeight]: weight of the text (default: normal).
  /// [lineHeight]: height of line spacing.
  /// [color]: text color (defaults to [colorText]).
  TextStyle baseTextStyle(
      double fontSize, {
        FontWeight fontWeight = FontWeight.normal,
        double lineHeight = 1.2,
        Color? color,
      }) {
    return GoogleFonts.poppins(
      fontSize: scale(fontSize),
      fontWeight: fontWeight,
      height: lineHeight,
      color: color ?? colorText,
    );
  }

  // ───────────────────── Headline Styles ─────────────────────

  /// Very large bold headline (scaled 52px).
  TextStyle get headline1 =>
      baseTextStyle(52, fontWeight: FontWeight.bold, lineHeight: 1.2);

  /// Large bold headline (scaled 36px).
  TextStyle get headline2 =>
      baseTextStyle(36, fontWeight: FontWeight.bold, lineHeight: 1.2);

  /// Medium bold headline (scaled 28px).
  TextStyle get headline3 =>
      baseTextStyle(28, fontWeight: FontWeight.bold, lineHeight: 1.25);

  /// Sub-heading style (scaled 24px).
  TextStyle get headline4 =>
      baseTextStyle(24, fontWeight: FontWeight.w600);

  /// Minor heading or section title (scaled 20px).
  TextStyle get headline5 =>
      baseTextStyle(20, fontWeight: FontWeight.w600);

  // ───────────────────── Body Styles ─────────────────────

  /// Extra large body text (scaled 18px).
  TextStyle get bodyExtraLarge => baseTextStyle(18);

  /// Bold extra large body text (scaled 18px).
  TextStyle get bodyBoldExtraLarge =>
      baseTextStyle(18, fontWeight: FontWeight.w600);

  /// Medium extra large body text (scaled 18px).
  TextStyle get bodyMediumExtraLarge =>
      baseTextStyle(18, fontWeight: FontWeight.w500);

  /// Large body text (scaled 16px).
  TextStyle get bodyLarge => baseTextStyle(16);

  /// Bold large body text (scaled 16px).
  TextStyle get bodyBoldLarge =>
      baseTextStyle(16, fontWeight: FontWeight.w600);

  /// Medium large body text (scaled 16px).
  TextStyle get bodyMediumLarge =>
      baseTextStyle(16, fontWeight: FontWeight.w500);

  /// Medium body text (scaled 14px).
  TextStyle get bodyMedium => baseTextStyle(14);

  /// Bold medium body text (scaled 14px).
  TextStyle get bodyBoldMedium =>
      baseTextStyle(14, fontWeight: FontWeight.w600);

  /// Small body text (scaled 12px).
  TextStyle get bodySmall =>
      baseTextStyle(12, lineHeight: 1.1);

  /// Bold small body text (scaled 12px).
  TextStyle get bodyBoldSmall =>
      baseTextStyle(12, fontWeight: FontWeight.w600);

  /// Caption or hint text (scaled 10px).
  TextStyle get caption =>
      baseTextStyle(10, lineHeight: 1.1);

  // ───────────────────── Button Styles ─────────────────────

  /// Default button text style (scaled 18px, bold).
  TextStyle get button =>
      baseTextStyle(18, fontWeight: FontWeight.w600);

  /// Accent-colored button style (scaled 18px, bold).
  TextStyle get accentButton =>
      baseTextStyle(18, fontWeight: FontWeight.w600, color: colorAccentText);
}
