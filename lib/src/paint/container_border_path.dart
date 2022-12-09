import 'dart:math';
import 'dart:ui';

import 'package:drawmat/src/paint/offset_definer.dart';
import 'package:drawmat/src/paint/path_border_definer.dart';

class ContainerPathBorder implements PathBorderDefiner {
  @override
  Path getLowSloppinesBorderPath(Size size, Offset offset) {
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
  Path getMediumSloppinesBorderPath(Size size, Offset offset, int seed) {
    Path path = Path();
    Random random = Random(seed);
    OffsetDefiner offsetDefiner = OffsetDefiner(seed: size.height.toInt());

    // Main path
    path.moveTo(offset.dx, offset.dy);
    offsetDefiner.quadraticBezierLeft(path, size, offset, false);
    offsetDefiner.quadraticBezierBottom(path, size, offset, false);
    offsetDefiner.quadraticBezierRight(path, size, offset, false);
    offsetDefiner.quadraticBezierTop(path, size, offset, false);

    // Second path
    offset = Offset(offset.dx + 3, offset.dy + 3);
    offsetDefiner =
        OffsetDefiner(seed: size.height.toInt() + random.nextInt(100));

    path.moveTo(offset.dx, offset.dy);
    offsetDefiner.quadraticBezierLeft(path, size, offset, true);
    offsetDefiner.quadraticBezierBottom(path, size, offset, true);
    offsetDefiner.quadraticBezierRight(path, size, offset, true);
    offsetDefiner.quadraticBezierTop(path, size, offset, true);
    return path;
  }

  @override
  Path getHighSloppinesBorderPath(Size size, Offset offset, int seed) {
    Path path = Path();
    Random random = Random(seed);
    OffsetDefiner offsetDefiner = OffsetDefiner(seed: size.height.toInt());

    // Main path
    path.moveTo(offset.dx, offset.dy);
    offsetDefiner.quadraticBezierLeft(path, size, offset, false);
    offsetDefiner.quadraticBezierBottom(path, size, offset, false);
    offsetDefiner.quadraticBezierRight(path, size, offset, false);
    offsetDefiner.quadraticBezierTop(path, size, offset, false);

    // Second path
    offset = Offset(offset.dx + 3, offset.dy + 3);
    offsetDefiner =
        OffsetDefiner(seed: size.height.toInt() + random.nextInt(100));

    path.moveTo(offset.dx, offset.dy);
    offsetDefiner.quadraticBezierLeft(path, size, offset, true);
    offsetDefiner.quadraticBezierBottom(path, size, offset, true);
    offsetDefiner.quadraticBezierRight(path, size, offset, true);
    offsetDefiner.quadraticBezierTop(path, size, offset, true);

    // Third path
    offset = Offset(offset.dx - 6, offset.dy - 6);
    offsetDefiner =
        OffsetDefiner(seed: size.height.toInt() + random.nextInt(100));
    offsetDefiner.moveToRandomKoef = 9;

    path.moveTo(offset.dx, offset.dy);
    offsetDefiner.quadraticBezierLeft(path, size, offset, true);
    offsetDefiner.quadraticBezierBottom(path, size, offset, true);
    offsetDefiner.quadraticBezierRight(path, size, offset, true);
    offsetDefiner.quadraticBezierTop(path, size, offset, true);

    return path;
  }
}
