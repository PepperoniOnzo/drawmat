import 'package:flutter/material.dart';

abstract class PathDefiner {
  /// Returns a path with low sloppiness.
  Path getLowSloppinesPath(Size size);

  /// Returns a path with medium sloppiness.
  Path getMediumSloppinesPath(Size size);

  /// Returns a path with high sloppiness.
  Path getHighSloppinesPath(Size size);
}
