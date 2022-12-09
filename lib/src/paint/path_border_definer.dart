import 'package:flutter/material.dart';

abstract class PathBorderDefiner {
  /// Returns a path with low sloppiness.
  Path getLowSloppinesBorderPath(Size size, Offset offset);

  /// Returns a path with medium sloppiness.
  Path getMediumSloppinesBorderPath(Size size, Offset offset, int seed);

  /// Returns a path with high sloppiness.
  Path getHighSloppinesBorderPath(Size size, Offset offset, int seed);
}
