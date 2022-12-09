import 'package:drawmat/src/paint/container_border_path.dart';
import 'package:flutter/material.dart';

import '../enums/enums.dart';
import '../paint/container_fill_path.dart';

part 'container_painter.dart';

/// A widget that draws a container around its child.
class DrawContainer extends StatelessWidget {
  const DrawContainer(
      {super.key,
      required this.child,
      this.strokesSloppines = Sloppines.low,
      this.fillsSloppines = Sloppines.low,
      this.strokeStyle = StrokeStyle.solid,
      this.strokeColor = Colors.black,
      this.fillColor = const Color(0xFFE0E0E0),
      this.strokeWidth = 2.0,
      this.fillWidth = 2.0,
      this.offset = const Offset(5, 5),
      this.seed = 0,
      this.isFilled = true,
      this.isStroked = true});

  /// The child widget.
  final Widget child;

  /// Color of the container. Defaults to [Colors.black].
  final Color strokeColor;

  /// Color of the container fill. Defaults to [Colors.grey.shade300].
  final Color fillColor;

  /// Width of the container. Defaults to [2.0].
  final double strokeWidth;

  /// Width of the container fill. Defaults to [2.0].
  final double fillWidth;

  /// The sloppiness of the container stroke. Defaults to [Sloppines.low].
  final Sloppines strokesSloppines;

  /// The sloppiness of the container fill. Defaults to [Sloppines.low].
  final Sloppines fillsSloppines;

  /// The stroke style of the container. Defaults to [StrokeStyle.solid].
  final StrokeStyle strokeStyle;

  /// Seed of the container random. Defaults to [0].
  final int seed;

  /// Whether the container is filled or not. Defaults to [true].
  final bool isFilled;

  /// Whether the container is stroked or not. Defaults to [true].
  final bool isStroked;

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
              strokesSloppines: strokesSloppines,
              fillsSloppines: fillsSloppines,
              strokeColor: strokeColor,
              fillColor: fillColor,
              strokeStyle: strokeStyle,
              strokeWidth: strokeWidth,
              fillWidth: fillWidth,
              offset: offset,
              seed: seed,
              isFilled: isFilled,
              isStroked: isStroked),
          child: child,
        ),
      ),
    );
  }
}
