import 'dart:math';
import 'dart:ui';

class OffsetDefiner {
  int logBase = 2;
  int logOffset = 0;

  OffsetDefiner([this.logBase = 2, this.logOffset = 0]);

  void quadraticBezierLeft(Path path, Size size, Offset offset) {
    path.quadraticBezierTo(
        (log(size.height) / log(logBase + 3 + logOffset)) % 5 + 1,
        size.height / 2,
        offset.dx,
        size.height - offset.dy);
    path.moveTo(offset.dx, size.height - offset.dy);
  }

  void quadraticBezierBottom(Path path, Size size, Offset offset) {
    path.quadraticBezierTo(
        size.width / 2,
        size.height - (log(size.width) / log(logBase + 1 + logOffset)) % 5 + 1,
        size.width - offset.dx,
        size.height - offset.dy);
    path.moveTo(size.width - offset.dx, size.height - offset.dy);
  }

  void quadraticBezierRight(Path path, Size size, Offset offset) {
    path.quadraticBezierTo(
        size.width - (log(size.height) / log(logBase + 2 + logOffset)) % 5 + 1,
        size.height / 2,
        size.width - offset.dx,
        offset.dy);
    path.moveTo(size.width - offset.dx, offset.dy);
  }

  void quadraticBezierTop(Path path, Size size, Offset offset) {
    path.quadraticBezierTo(
        size.width / 2,
        (log(size.width) / log(logBase + logOffset)) % 5 + 1,
        offset.dx,
        offset.dy);
    path.moveTo(offset.dx, offset.dy);
  }
}
