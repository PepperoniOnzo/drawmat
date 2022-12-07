import 'dart:math';
import 'package:flutter/material.dart';

import '../enums/enums.dart';

part 'container_painter.dart';

/// A widget that draws a container around its child.
class DrawContainer extends StatelessWidget {
  const DrawContainer(
      {super.key,
      required this.child,
      this.sloppines = Sloppines.low,
      this.strokeStyle = StrokeStyle.solid,
      this.color = Colors.black,
      this.width = 2.0});

  /// The child widget.
  final Widget child;

  /// Color of the container. Defaults to [Colors.black].
  final Color color;

  /// Width of the container. Defaults to [2.0].
  final double width;

  /// The sloppiness of the container. Defaults to [Sloppines.low].
  final Sloppines sloppines;

  /// The stroke style of the container. Defaults to [StrokeStyle.solid].
  final StrokeStyle strokeStyle;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: RepaintBoundary(
        child: CustomPaint(
          painter: _DrawContainerPainter(
            sloppines: sloppines,
            color: color,
            strokeStyle: strokeStyle,
            width: width,
          ),
          child: child,
        ),
      ),
    );
  }
}
