import 'package:flutter/material.dart';

/// Displays text as if it is being typed character by character.
///
/// Useful for welcome screens, storytelling, chat bubbles, or onboarding.
class TypewriterText extends StatefulWidget {
  /// The full text to display.
  final String text;

  /// Text style.
  final TextStyle? style;

  /// Delay between each character.
  final Duration characterDelay;

  /// Optional cursor symbol (e.g., "|", "_").
  final String? cursor;

  /// Delay before repeating the typing (only if [loop] is true).
  final Duration pause;

  /// Should the animation loop?
  final bool loop;

  /// Should it show the full text immediately if animation is done?
  final bool showFullOnFinish;

  const TypewriterText({
    super.key,
    required this.text,
    this.style,
    this.characterDelay = const Duration(milliseconds: 50),
    this.cursor,
    this.pause = const Duration(seconds: 1),
    this.loop = false,
    this.showFullOnFinish = true,
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  late final String _text;
  int _currentLength = 0;
  bool _finished = false;

  @override
  void initState() {
    super.initState();
    _text = widget.text;
    _startTyping();
  }

  void _startTyping() async {
    while (mounted) {
      for (int i = 1; i <= _text.length; i++) {
        await Future.delayed(widget.characterDelay);
        if (!mounted) return;
        setState(() {
          _currentLength = i;
        });
      }

      setState(() => _finished = true);

      if (!widget.loop) break;

      await Future.delayed(widget.pause);

      if (!mounted) return;

      setState(() {
        _currentLength = 0;
        _finished = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayed = _finished && widget.showFullOnFinish
        ? _text
        : _text.substring(0, _currentLength);

    final withCursor = widget.cursor != null
        ? displayed + (widget.loop || !_finished ? widget.cursor ?? '' : '')
        : displayed;

    return Text(withCursor, style: widget.style);
  }
}
