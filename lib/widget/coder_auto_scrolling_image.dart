import 'dart:async';
import 'package:flutter/material.dart';

/// Enum to define scroll direction.
enum ScrollAxis { horizontal, vertical }

/// A widget that scrolls an image repeatedly in a given direction.
class CoderAutoScrollingImage extends StatefulWidget {
  /// Path to the image asset. This is required.
  final String assetPath;

  /// Direction to scroll the image: horizontal or vertical.
  final ScrollAxis axis;

  /// Speed of the auto-scrolling animation. Higher means faster.
  final double scrollSpeed;

  /// How to inscribe the image into the space allocated.
  final BoxFit fit;

  /// Number of times to repeat the image for continuous scrolling effect.
  final int repetitionCount;

  /// Width of each image widget (used for vertical scrolling).
  final double? width;

  /// Height of each image widget (used for horizontal scrolling).
  final double? height;

  const CoderAutoScrollingImage({
    super.key,
    required this.assetPath,
    this.axis = ScrollAxis.horizontal,
    this.scrollSpeed = 1.0,
    this.fit = BoxFit.cover,
    this.repetitionCount = 10,
    this.width,
    this.height,
  });

  @override
  State<CoderAutoScrollingImage> createState() =>
      _CoderAutoScrollingImageState();
}

class _CoderAutoScrollingImageState extends State<CoderAutoScrollingImage> {
  final ScrollController _scrollController = ScrollController();
  late Timer _scrollTimer;
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _startScrolling();
  }

  /// Starts a periodic timer to scroll the content by small steps.
  void _startScrolling() {
    _scrollTimer = Timer.periodic(const Duration(milliseconds: 30), (_) {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        _scrollPosition += widget.scrollSpeed;

        if (_scrollPosition >= maxScroll) {
          _scrollPosition = 0;
        }

        _scrollController.jumpTo(_scrollPosition);
      }
    });
  }

  @override
  void dispose() {
    _scrollTimer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Generate repeated image widgets.
    final children = List.generate(
      widget.repetitionCount,
          (_) => Image.asset(
        widget.assetPath,
        fit: widget.fit,
        width: widget.axis == ScrollAxis.vertical
            ? widget.width ?? double.infinity
            : null,
        height: widget.axis == ScrollAxis.horizontal
            ? widget.height ?? double.infinity
            : null,
      ),
    );

    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: widget.axis == ScrollAxis.horizontal
          ? Axis.horizontal
          : Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      child: widget.axis == ScrollAxis.horizontal
          ? Row(children: children)
          : Column(children: children),
    );
  }
}

