import 'package:dpro_regilo/draw_engine/draw_unit/draw_unit.dart';
import 'package:flutter/material.dart';

class DrawTransformer extends DrawUnit {
  Offset offset;
  Offset relativeOffset;
  Offset scale;
  double rotate;
  List<DrawUnit> children;
  DrawTransformer({
    required this.children,
    this.offset = Offset.zero,
    this.relativeOffset = Offset.zero,
    this.scale = const Offset(1, 1),
    this.rotate = 0,
  });

  void transform(Canvas canvas, Size size) {
    _canvas = canvas;
    canvas.save();
    if (offset != Offset.zero) {
      canvas.translate(offset.dx, offset.dy);
    }
    if (relativeOffset != Offset.zero) {
      canvas.translate(
        relativeOffset.dx * size.width,
        relativeOffset.dy * size.height,
      );
    }
    if (scale != const Offset(1, 1)) {
      canvas.scale(scale.dx, scale.dy);
    }
    if (rotate != 0) {
      canvas.rotate(rotate);
    }
  }

  Canvas? _canvas;
  void restore() {
    _canvas?.restore();
    _canvas = null;
  }
}
