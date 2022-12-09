import 'dart:math';
import 'dart:ui';

class OffsetDefiner {
  int seed;
  int moveToRandomKoef = 6;
  late Random random;

  OffsetDefiner({required this.seed}) {
    random = Random(seed);
  }

  void moveTo(double x, double y, Path path, bool newPath) {
    if (!newPath) {
      path.moveTo(x, y);
      return;
    }
    path.moveTo(x + random.nextInt(moveToRandomKoef) - 3,
        y + random.nextInt(moveToRandomKoef) - 3);
  }

  void quadraticBezierLeft(Path path, Size size, Offset offset, bool newPath) {
    path.quadraticBezierTo(random.nextInt(6) + 1, size.height / 2, offset.dx,
        size.height - offset.dy);
    moveTo(offset.dx, size.height - offset.dy, path, newPath);
  }

  void quadraticBezierBottom(
      Path path, Size size, Offset offset, bool newPath) {
    path.quadraticBezierTo(size.width / 2, size.height - random.nextInt(6) + 1,
        size.width - offset.dx, size.height - offset.dy);
    moveTo(size.width - offset.dx, size.height - offset.dy, path, newPath);
  }

  void quadraticBezierRight(Path path, Size size, Offset offset, bool newPath) {
    path.quadraticBezierTo(size.width - random.nextInt(6) + 1, size.height / 2,
        size.width - offset.dx, offset.dy);
    moveTo(size.width - offset.dx, offset.dy, path, newPath);
  }

  void quadraticBezierTop(Path path, Size size, Offset offset, bool newPath) {
    path.quadraticBezierTo(
        size.width / 2, random.nextInt(6) + 1, offset.dx, offset.dy);
    path.moveTo(offset.dx, offset.dy);
  }
}
