part of 'container.dart';

class _DrawContainerPainter extends CustomPainter with ContainerPath {
  /// Color of the container. Defaults to [Colors.black].
  final Color color;

  /// Width of the container. Defaults to [2.0].
  final double width;

  /// The sloppiness of the container. Defaults to [Sloppines.low].
  final Sloppines sloppines;

  /// The stroke style of the container. Defaults to [StrokeStyle.solid].
  final StrokeStyle strokeStyle;

  /// Offset of the container. Defaults to [Offset.zero].
  final Offset offset;

  /// Seed of the container random. Defaults to [0].
  final int seed;

  _DrawContainerPainter(
      {required this.width,
      required this.sloppines,
      required this.strokeStyle,
      required this.color,
      required this.offset,
      required this.seed});

  @override
  void paint(Canvas canvas, Size size) {
    Path path;
    Paint paint = Paint();

    // Get the path based on the sloppiness.
    if (sloppines == Sloppines.low) {
      path = getLowSloppinesPath(size, offset);
    } else if (sloppines == Sloppines.medium) {
      path = getMediumSloppinesPath(size, offset, seed);
    } else {
      path = getHighSloppinesPath(size, offset, seed);
    }

    // Set the paint style.
    if (strokeStyle == StrokeStyle.solid) {
      paint.style = PaintingStyle.stroke;
    } else if (strokeStyle == StrokeStyle.dashed) {
      throw UnimplementedError();
    } else {
      throw UnimplementedError();
    }

    // Set the paint properties.
    paint.color = color;
    paint.strokeWidth = width;

    // Draw the path.
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
