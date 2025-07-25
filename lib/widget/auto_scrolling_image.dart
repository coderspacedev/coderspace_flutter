import 'dart:async';
import 'package:flutter/material.dart';

enum ScrollAxis { horizontal, vertical }

class AutoScrollingImage extends StatefulWidget {
  final String assetPath;
  final ScrollAxis axis;
  final double scrollSpeed;
  final BoxFit fit;
  final int repetitionCount;
  final double? width;
  final double? height;

  const AutoScrollingImage({
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
  State<AutoScrollingImage> createState() => _AutoScrollingImageState();
}

class _AutoScrollingImageState extends State<AutoScrollingImage> {
  final ScrollController _scrollController = ScrollController();
  late Timer _scrollTimer;
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _startScrolling();
  }

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
