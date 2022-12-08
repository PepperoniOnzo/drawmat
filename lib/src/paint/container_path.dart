import 'dart:ui';

import 'package:drawmat/src/paint/offset_definer.dart';
import 'package:drawmat/src/paint/path_definer.dart';

class ContainerPath implements PathDefiner {
  @override
  Path getLowSloppinesPath(Size size, Offset offset) {
    Path path = Path();
    path.moveTo(offset.dx, offset.dy);
    path.lineTo(offset.dx, size.height - offset.dy);
    path.lineTo(size.width - offset.dx, size.height - offset.dy);
    path.lineTo(size.width - offset.dx, offset.dy);
    path.lineTo(offset.dx, offset.dy);
    path.close();
    return path;
  }

  @override
  Path getMediumSloppinesPath(Size size, Offset offset) {
    Path path = Path();
    OffsetDefiner offsetDefiner = OffsetDefiner();
    
    // Main path
    path.moveTo(offset.dx, offset.dy);
    offsetDefiner.quadraticBezierLeft(path, size, offset);
    offsetDefiner.quadraticBezierBottom(path, size, offset);
    offsetDefiner.quadraticBezierRight(path, size, offset);
    offsetDefiner.quadraticBezierTop(path, size, offset);

    // Second path
    offset = Offset(offset.dx + 3, offset.dy + 3);
    offsetDefiner.logOffset += 3;

    path.moveTo(0, 0);
    offsetDefiner.quadraticBezierLeft(path, size, offset);
    offsetDefiner.quadraticBezierBottom(path, size, offset);
    offsetDefiner.quadraticBezierRight(path, size, offset);
    offsetDefiner.quadraticBezierTop(path, size, offset);
    return path;
  }

  @override
  Path getHighSloppinesPath(Size size, Offset offset) {
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
