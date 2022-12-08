import 'dart:math';
import 'dart:ui';

import 'package:drawmat/src/paint/path_definer.dart';

class ContainerPath implements PathDefiner {
  @override
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

  @override
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

  @override
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
}
