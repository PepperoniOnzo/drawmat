part of 'container.dart';

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
    Paint paint = Paint();

    // Get the path based on the sloppiness.
    if (sloppines == Sloppines.low) {
      path = getLowSloppinesPath(size);
    } else if (sloppines == Sloppines.medium) {
      path = getMediumSloppinesPath(size);
    } else {
      path = getHighSloppinesPath(size);
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
    Random random = Random();

    path.moveTo(0, 0);
    path.quadraticBezierTo(
        random.nextInt(6).toDouble(), size.height / 2, 0, size.height);
    path.quadraticBezierTo(size.width / 2,
        size.height - random.nextInt(6).toDouble(), size.width, size.height);
    path.quadraticBezierTo(size.width - random.nextInt(6).toDouble(),
        size.height / 2, size.width, 0);
    path.quadraticBezierTo(size.width / 2, random.nextInt(6).toDouble(), 0, 0);

    switch (random.nextInt(4)) {
      case 0:
        path.moveTo(random.nextInt(3).toDouble(), random.nextInt(3).toDouble());
        path.quadraticBezierTo(
            random.nextInt(6).toDouble() + 6, size.height / 2, 0, size.height);
        break;
      case 1:
        path.moveTo(random.nextInt(3).toDouble(),
            size.height - random.nextInt(3).toDouble());
        path.quadraticBezierTo(
            size.width / 2,
            size.height - random.nextInt(6).toDouble() + 6,
            size.width,
            size.height);
        break;
      case 2:
        path.moveTo(size.width - random.nextInt(3).toDouble(),
            size.height - random.nextInt(3).toDouble());
        path.quadraticBezierTo(size.width - random.nextInt(6).toDouble() + 6,
            size.height / 2, size.width, 0);
        break;
      case 3:
        path.moveTo(size.width - random.nextInt(3).toDouble(),
            random.nextInt(3).toDouble());
        path.quadraticBezierTo(
            size.width / 2, random.nextInt(6).toDouble() + 6, 0, 0);
        break;
      default:
    }

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
