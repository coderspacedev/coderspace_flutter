import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:coderspace/coderspace.dart';

/// A customizable text field widget used throughout the app.
///
/// [CoderTextField] wraps a [TextField] with consistent styling,
/// and provides support for prefix/suffix icons, hint text,
/// input formatting, keyboard type, and more.
class CoderTextField extends StatelessWidget {
  /// Controller for managing the input text.
  final TextEditingController controller;

  /// Optional hint text to display when the field is empty.
  final String? hint;

  /// An optional icon displayed at the start of the text field.
  final IconData? prefixIcon;

  /// An optional widget displayed at the end of the text field.
  final Widget? suffixIcon;

  /// Whether to obscure the text, typically for passwords.
  final bool obscureText;

  /// The type of keyboard to use for editing the text.
  final TextInputType? keyboardType;

  /// Optional input formatters to control or restrict input.
  final List<TextInputFormatter>? inputFormatters;

  /// The maximum number of lines to show.
  final int? maxLines;

  /// Whether the field is enabled or disabled.
  final bool enabled;

  /// Optional custom padding for the content inside the field.
  final EdgeInsetsGeometry? contentPadding;

  /// Creates a [CoderTextField] with the given configuration.
  ///
  /// The [controller] parameter is required.
  const CoderTextField({
    super.key,
    required this.controller,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines,
    this.enabled = true,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      enabled: enabled,
      style: context.bodyLarge,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: colorText)
            : null,
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: context.bodyLarge.copyWith(color: colorText.withAlpha(100)),
        filled: true,
        fillColor: colorCard,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.scale(12)),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(
              horizontal: context.scale(16),
              vertical: context.scale(14),
            ),
      ),
    );
  }
}
