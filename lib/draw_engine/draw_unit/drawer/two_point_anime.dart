import 'dart:ui';

import 'package:dpro_regilo/draw_engine/draw_unit/drawer/drawer.dart';
import 'package:flutter/src/rendering/custom_paint.dart';

class TwoPointAnime extends Drawer {
  Paint p = Paint();
  final from = Offset.zero;
  final to = const Offset(50, -50);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(from, 10, p);
    canvas.drawCircle(to, 10, p);
    canvas.drawLine(from, to, p);
  }
}
