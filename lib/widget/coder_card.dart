import 'package:coderspace/coderspace.dart';
import 'package:flutter/material.dart';

/// A customizable card-like UI component that supports a leading icon,
/// title, optional subtitle, trailing widget, tap interaction, and an optional divider.
///
/// Example usage:
/// ```dart
/// CoderCard(
///   leading: Icon(Icons.settings, color: Colors.blue),
///   title: 'Settings',
///   subtitle: 'Manage app preferences',
///   trailing: Icon(Icons.chevron_right),
///   onTap: () => print('Tapped!'),
///   showDivider: true,
/// )
/// ```
class CoderCard extends StatelessWidget {
  /// Widget displayed at the start (e.g., icon, avatar, etc.).
  final Widget? leading;

  /// Main title text of the card.
  final String title;

  /// Optional subtitle shown below the [title].
  final String? subtitle;

  /// Widget displayed at the end (e.g., arrow icon, toggle switch, etc.).
  final Widget? trailing;

  /// Called when the card is tapped.
  final VoidCallback? onTap;

  /// Background color of the card. Defaults to [colorCard] if not specified.
  final Color? backgroundColor;

  /// Padding applied inside the card content.
  final EdgeInsetsGeometry padding;

  /// The border radius applied to the card’s corners.
  final double borderRadius;

  /// Whether to show a divider line below the subtitle.
  final bool showDivider;

  /// Optional color for the title text.
  final Color? textColor;

  /// Optional color for the subtitle text.
  final Color? subtitleColor;

  /// Creates a [CoderCard] with optional customization.
  const CoderCard({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 12,
    this.showDivider = false,
    this.textColor,
    this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? AppTheme.colors.card,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Padding(
          padding: padding,
          child: Row(
            children: [
              // Show leading widget if provided
              if (leading != null) ...[
                leading ?? SizedBox.shrink(),
                const SizedBox(width: 12),
              ],
              // Expandable content area for title and subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title text
                    Text(
                      title,
                      style: context.bodyBoldLarge.copyWith(
                        color: textColor ?? AppTheme.colors.cardText,
                      ),
                    ),
                    // Subtitle if present
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle ?? '',
                        style: context.bodySmall.copyWith(
                          color:
                              subtitleColor ??
                              AppTheme.colors.cardText.withAlpha(150),
                        ),
                      ),
                    ],
                    // Optional divider
                    if (showDivider) ...[
                      const SizedBox(height: 12),
                      Divider(height: 1, color: Colors.grey.withAlpha(84)),
                    ],
                  ],
                ),
              ),
              // Show trailing widget if provided
              if (trailing != null) ...[
                const SizedBox(width: 12),
                trailing ?? SizedBox.shrink(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
