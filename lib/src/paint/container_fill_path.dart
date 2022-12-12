import 'dart:math';
import 'dart:ui';

import 'package:drawmat/src/paint/path_fill_definer.dart';

class ContainerFillPath implements PathFillDefiner {
  @override
  Path getLowSloppinesFillPath(Size size, Offset offset) {
    Path path = Path();

    // Kof
    int kof = 15;

    // Calculating the shift between each line
    double shift =
        size.height > size.width ? size.height / kof : size.width / kof;

    // Calculating the number of lines to draw
    int repeats =
        (size.height > size.width ? size.width : size.height) ~/ shift +
            kof -
            1;

    // Drawing the lines
    double xMove, yMove;
    for (var i = 1; i < repeats; i++) {
      // Calculating the x and y coordinates start of the line
      xMove = i * shift + offset.dx;
      if (xMove > size.width - offset.dx) {
        yMove = xMove - size.width + offset.dy * 2;
        xMove = size.width - offset.dx;
      } else {
        yMove = offset.dy;
      }
      path.moveTo(xMove, yMove);

      // Calculating the x and y coordinates end of the line
      yMove = i * shift + offset.dy;
      if (yMove > size.height - offset.dy) {
        xMove = yMove - size.height + offset.dx * 2;
        yMove = size.height - offset.dy;
      } else {
        xMove = offset.dx;
      }
      path.lineTo(xMove, yMove);
    }

    return path;
  }

  @override
  Path getPathWithRandom(Path path, Size size, Offset offset, int seed) {
    Random random = Random(seed);

    // Kof
    int kof = 15;

    // Calculating the shift between each line
    double shift =
        size.height > size.width ? size.height / kof : size.width / kof;

    // Calculating the number of lines to draw
    int repeats =
        (size.height > size.width ? size.width : size.height) ~/ shift +
            kof -
            1;

    // Drawing the lines
    double xMove, yMove, xCordFirst, yCordFirst, xCordSecond, yCordSecond;
    for (var i = 1; i < repeats; i++) {
      // Calculating the x and y coordinates start of the line
      xMove = i * shift + offset.dx;
      if (xMove > size.width - offset.dx) {
        yMove = xMove - size.width + offset.dy * 2;
        xMove = size.width - offset.dx;
      } else {
        yMove = offset.dy;
      }

      // Calculating the x and y coordinates of the first control point
      xCordFirst = xMove + random.nextInt(11) - 5;
      yCordFirst = yMove + random.nextInt(11) - 5;

      path.moveTo(xMove, yMove);

      // Calculating the x and y coordinates end of the line
      yMove = i * shift + offset.dy;
      if (yMove > size.height - offset.dy) {
        xMove = yMove - size.height + offset.dx * 2;
        yMove = size.height - offset.dy;
      } else {
        xMove = offset.dx;
      }

      // Calculating the x and y coordinates of the second control point
      xCordSecond = xMove + random.nextInt(11) - 5;
      yCordSecond = yMove + random.nextInt(11) - 5;

      path.quadraticBezierTo(
          (xCordFirst + xCordSecond) / 2 + random.nextInt(6) + 1,
          (yCordFirst + yCordSecond) / 2 + random.nextInt(6) + 1,
          xCordSecond,
          yCordSecond);
    }
    return path;
  }

  @override
  Path getHighSloppinesFillPath(Size size, Offset offset, int seed) {
    Path path = getLowSloppinesFillPath(size, offset);
    path = getPathWithRandom(path, size, offset, seed);
    return path;
  }

  @override
  Path getMediumSloppinesFillPath(Size size, Offset offset, int seed) {
    Path path = getLowSloppinesFillPath(size, offset);
    path = getPathWithRandom(path, size, offset, seed + 1);
    path = getPathWithRandom(path, size, offset, seed + 2);
    return path;
  }
}
