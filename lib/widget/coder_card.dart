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
  /// Widget displayed at the start (e.g., icon or avatar).
  final Widget? leading;

  /// Main title text of the card.
  final String title;

  /// Optional subtitle shown below the title.
  final String? subtitle;

  /// Widget displayed at the end (e.g., an arrow or button).
  final Widget? trailing;

  /// Callback triggered when the card is tapped.
  final VoidCallback? onTap;

  /// Background color of the card. Defaults to [colorCard] if not provided.
  final Color? backgroundColor;

  /// Padding inside the card content.
  final EdgeInsetsGeometry padding;

  /// Border radius of the card's corners.
  final double borderRadius;

  /// Whether to show a divider below the subtitle (visually separates cards).
  final bool showDivider;

  /// Creates a CoderCard with rich content and interaction.
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
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? colorCard,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Padding(
          padding: padding,
          child: Row(
            children: [
              if (leading != null) ...[
                leading!,
                const SizedBox(width: 12),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle!,
                        style: context.bodySmall,
                      ),
                    ],
                    if (showDivider) ...[
                      const SizedBox(height: 12),
                      Divider(height: 1, color: Colors.grey.withAlpha(84)),
                    ],
                  ],
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: 12),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

