import 'package:flutter/material.dart';

import '../enums/enums.dart';

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
      child: CustomPaint(
        painter: _DrawContainerPainter(
          sloppines: sloppines,
          color: color,
          strokeStyle: strokeStyle,
          width: width,
        ),
        child: child,
      ),
    );
  }
}

class _DrawContainerPainter extends CustomPainter {
  /// Color of the container. Defaults to [Colors.black].
  final Color color;

  /// Width of the container. Defaults to [2.0].
  final double width;

  /// The sloppiness of the container. Defaults to [Sloppines.low].
  final Sloppines sloppines;

  /// The stroke style of the container. Defaults to [StrokeStyle.solid].
  final StrokeStyle strokeStyle;

  _DrawContainerPainter(
      {required this.width,
      required this.sloppines,
      required this.strokeStyle,
      required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path;

    if (sloppines == Sloppines.low) {
      path = getLowSloppinesPath(size);
    } else if (sloppines == Sloppines.medium) {
      path = getMediumSloppinesPath(size);
    } else {
      path = getHighSloppinesPath(size);
    }

    Paint paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = width;
    canvas.drawPath(path, paint);
  }

  /// Returns a path with low sloppiness.
  Path getLowSloppinesPath(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  /// Returns a path with medium sloppiness.
  Path getMediumSloppinesPath(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  /// Returns a path with high sloppiness.
  Path getHighSloppinesPath(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
