part of 'container.dart';

class _DrawContainerPainter extends CustomPainter
    with ContainerPathBorder, ContainerFillPath {
  /// Color of the container stroke. Defaults to [Colors.black].
  final Color strokeColor;

  /// Color of the container fill. Defaults to [Colors.grey].
  final Color fillColor;

  /// Width of the container stroke. Defaults to [2.0].
  final double strokeWidth;

  /// Width of the container fill. Defaults to [2.0].
  final double fillWidth;

  /// The sloppiness of the container stroke. Defaults to [Sloppines.low].
  final Sloppines strokesSloppines;

  /// The sloppiness of the container fill. Defaults to [Sloppines.low].
  final Sloppines fillsSloppines;

  /// The stroke style of the container. Defaults to [StrokeStyle.solid].
  final StrokeStyle strokeStyle;

  /// Offset of the container. Defaults to [Offset.zero].
  final Offset offset;

  /// Seed of the container random. Defaults to [0].
  final int seed;

  /// Whether the container is filled or not. Defaults to [true].
  final bool isFilled;

  /// Whether the container is stroked or not. Defaults to [true].
  final bool isStroked;

  _DrawContainerPainter(
      {required this.strokeWidth,
      required this.fillWidth,
      required this.strokesSloppines,
      required this.fillsSloppines,
      required this.strokeStyle,
      required this.strokeColor,
      required this.fillColor,
      required this.offset,
      required this.seed,
      required this.isFilled,
      required this.isStroked});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    // Draw the background.
    if (isFilled) {
      Path backgroundPath = Path();

      // Get the path based on the sloppiness.
      if (fillsSloppines == Sloppines.low) {
        backgroundPath = getLowSloppinesFillPath(size, offset);
      } else if (fillsSloppines == Sloppines.medium) {
        //backgroundPath = getMediumSloppinesFillPath(size, offset, seed);
      } else {
        //backgroundPath = getHighSloppinesFillPath(size, offset, seed);
      }

      paint.style = PaintingStyle.stroke;

      // Set the paint properties.
      paint.color = fillColor;
      paint.strokeWidth = fillWidth;

      // Draw the path.
      canvas.drawPath(backgroundPath, paint);
    }

    // Draw the stroke around the container.
    if (isStroked) {
      Path path;

      // Get the path based on the sloppiness.
      if (strokesSloppines == Sloppines.low) {
        path = getLowSloppinesBorderPath(size, offset);
      } else if (strokesSloppines == Sloppines.medium) {
        path = getMediumSloppinesBorderPath(size, offset, seed);
      } else {
        path = getHighSloppinesBorderPath(size, offset, seed);
      }

      // Set the paint style.
      // if (strokeStyle == StrokeStyle.solid) {
      paint.style = PaintingStyle.stroke;
      // } else if (strokeStyle == StrokeStyle.dashed) {
      //   throw UnimplementedError();
      // } else {
      //   throw UnimplementedError();
      // }

      // Set the paint properties.
      paint.color = strokeColor;
      paint.strokeWidth = strokeWidth;

      // Draw the path.
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
