import 'package:coderspace/coderspace.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension AppStyles on BuildContext{

  double scale(double size) => size * _scale;

  double get _scale {
    double width = MediaQuery.of(this).size.width;
    if (width >= 1024) return 1.6;
    if (width >= 768) return 1.35;
    return 1.0;
  }

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

  // Headline styles
  TextStyle get headline1 =>
      baseTextStyle(52, fontWeight: FontWeight.bold, lineHeight: 1.2);
  TextStyle get headline2 =>
      baseTextStyle(36, fontWeight: FontWeight.bold, lineHeight: 1.2);
  TextStyle get headline3 =>
      baseTextStyle(28, fontWeight: FontWeight.bold, lineHeight: 1.25);
  TextStyle get headline4 => baseTextStyle(24, fontWeight: FontWeight.w600);
  TextStyle get headline5 => baseTextStyle(20, fontWeight: FontWeight.w600);

  // Body styles
  TextStyle get bodyExtraLarge => baseTextStyle(18);
  TextStyle get bodyBoldExtraLarge =>
      baseTextStyle(18, fontWeight: FontWeight.w600);
  TextStyle get bodyMediumExtraLarge =>
      baseTextStyle(18, fontWeight: FontWeight.w500);
  TextStyle get bodyLarge => baseTextStyle(16);
  TextStyle get bodyBoldLarge => baseTextStyle(16, fontWeight: FontWeight.w600);
  TextStyle get bodyMediumLarge =>
      baseTextStyle(16, fontWeight: FontWeight.w500);
  TextStyle get bodyMedium => baseTextStyle(14);
  TextStyle get bodyBoldMedium =>
      baseTextStyle(14, fontWeight: FontWeight.w600);
  TextStyle get bodySmall => baseTextStyle(12, lineHeight: 1.1);
  TextStyle get bodyBoldSmall => baseTextStyle(12, fontWeight: FontWeight.w600);
  TextStyle get caption => baseTextStyle(10, lineHeight: 1.1);

  // Button styles
  TextStyle get button => baseTextStyle(18, fontWeight: FontWeight.w600);
  TextStyle get accentButton =>
      baseTextStyle(18, fontWeight: FontWeight.w600, color: colorAccentText);
}
