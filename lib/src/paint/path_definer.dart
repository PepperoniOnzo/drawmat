import 'package:drawmat/src/paint/offset_definer.dart';
import 'package:flutter/material.dart';

abstract class PathDefiner {
  /// Returns a path with low sloppiness.
  Path getLowSloppinesPath(Size size, Offset offset);

  /// Returns a path with medium sloppiness.
  Path getMediumSloppinesPath(Size size, Offset offset, int seed);

  /// Returns a path with high sloppiness.
  Path getHighSloppinesPath(Size size, Offset offset, int seed);
}
