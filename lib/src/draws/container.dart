import 'package:drawmat/src/paint/container_path.dart';
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
      this.width = 2.0,
      this.offset = const Offset(5, 5),
      this.seed = 0});

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

  /// Seed of the container random. Defaults to [0].
  final int seed;

  /// Offset of the container. Defaults to [Offset(5, 5)].
  /// The offset is clamped to a maximum of [Offset(10, 10)] and minimum of [Offset(5, 5)].
  final Offset offset;
  set offset(Offset value) {
    if (value > const Offset(10, 10)) {
      offset = const Offset(10, 10);
    } else if (value < const Offset(5, 5)) {
      offset = const Offset(5, 5);
    } else {
      offset = value;
    }
  }

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
              offset: offset,
              seed: seed),
          child: child,
        ),
      ),
    );
  }
}
