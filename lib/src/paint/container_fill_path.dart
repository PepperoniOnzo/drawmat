import 'dart:ui';

import 'package:drawmat/src/paint/path_fill_definer.dart';

class ContainerFillPath implements PathFillDefiner {
  @override
  Path getLowSloppinesFillPath(Size size, Offset offset) {
    Path path = Path();
    int repeats =
        size.height > size.width ? size.width ~/ 10 : size.height ~/ 10;
    double shift =
        size.height > size.width ? size.width / 10 : size.height / 10;
    //TODO: Complete
    double xMove, yMove;
    for (var i = 1; i < repeats; i++) {
      xMove = i * shift + offset.dx;
      if (xMove > size.width - offset.dx) {
        yMove = xMove - size.height - offset.dx;
        xMove = size.width + offset.dx;
      } else {
        yMove = i * shift + offset.dy;

        if (yMove > size.width + offset.dy) {
          xMove = yMove - size.width - offset.dy;
          yMove = size.height + offset.dy;
        }
      }
      path.moveTo(xMove, yMove);

      
    }

    return path;
  }

  @override
  Path getHighSloppinesFillPath(Size size, Offset offset, int seed) {
    // TODO: implement getHighSloppinesFillPath
    throw UnimplementedError();
  }

  @override
  Path getMediumSloppinesFillPath(Size size, Offset offset, int seed) {
    // TODO: implement getMediumSloppinesFillPath
    throw UnimplementedError();
  }
}
