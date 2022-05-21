import 'package:dpro_regilo/draw_engine/draw_unit/draw_unit.dart';
import 'package:flutter/widgets.dart';

abstract class Drawer extends CustomPainter with DrawUnit {
  @override
  void paint(Canvas canvas, Size size);
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
