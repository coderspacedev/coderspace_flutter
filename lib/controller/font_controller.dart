import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppFontSource { google, local, system }

class DynamicFontController {
  DynamicFontController._private();
  static final instance = DynamicFontController._private();

  // Current font configuration
  ValueNotifier<FontConfig> currentFont = ValueNotifier<FontConfig>(
    FontConfig(
      source: AppFontSource.google,
      googleFont: ([base]) => GoogleFonts.montserrat(textStyle: base),
    ),
  );

  /// Set a Google font dynamically
  void setGoogleFont(TextStyle Function([TextStyle?]) googleFont) {
    currentFont.value = FontConfig(
      source: AppFontSource.google,
      googleFont: googleFont,
    );
  }

  /// Set a local font dynamically (must be declared in pubspec.yaml)
  void setLocalFont(String fontFamily) {
    currentFont.value = FontConfig(
      source: AppFontSource.local,
      localFontFamily: fontFamily,
    );
  }

  /// Revert to system default font
  void setSystemFont() {
    currentFont.value = FontConfig(source: AppFontSource.system);
  }

  TextStyle applyFont(TextStyle base) {
    final config = currentFont.value;

    switch (config.source) {
      case AppFontSource.google:
        if (config.googleFont != null) {
          return config.googleFont!(base);
        }
        break;
      case AppFontSource.local:
        if (config.localFontFamily != null) {
          return base.copyWith(fontFamily: config.localFontFamily);
        }
        break;
      case AppFontSource.system:
        return base;
    }

    return base;
  }
}

class FontConfig {
  final AppFontSource source;
  final TextStyle Function([TextStyle?])? googleFont;
  final String? localFontFamily;

  FontConfig({required this.source, this.googleFont, this.localFontFamily});
}
