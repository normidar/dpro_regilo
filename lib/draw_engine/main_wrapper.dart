import 'package:dpro_regilo/draw_engine/draw_unit/draw_transform.dart';
import 'package:dpro_regilo/draw_engine/draw_unit/draw_unit.dart';
import 'package:dpro_regilo/draw_engine/draw_unit/drawer/drawer.dart';
import 'package:dpro_regilo/draw_engine/draw_unit/drawer/two_point_anime.dart';
import 'package:flutter/widgets.dart';

class MainWrapper extends CustomPainter {
  List<DrawUnit> children = [
    DrawTransformer(
      children: [TwoPointAnime()],
      relativeOffset: const Offset(.3, .3),
    ),
    DrawTransformer(
      children: [TwoPointAnime()],
      relativeOffset: const Offset(.5, .5),
    ),
    DrawTransformer(
      children: [TwoPointAnime()],
      relativeOffset: const Offset(.4, .6),
    ),
    DrawTransformer(
      children: [TwoPointAnime()],
      relativeOffset: const Offset(.6, .6),
    ),
    DrawTransformer(
      children: [TwoPointAnime()],
      relativeOffset: const Offset(.5, .7),
    ),
    DrawTransformer(
      children: [TwoPointAnime()],
      relativeOffset: const Offset(0, 1),
    ),
  ];
  @override
  void paint(Canvas canvas, Size size) {
    drawUnits(children, canvas, size);
  }

  void drawUnits(List<DrawUnit> children, Canvas canvas, Size size) {
    for (int i = children.length - 1; i >= 0; i--) {
      drawDrawUnit(children[i], canvas, size);
    }
  }

  void drawDrawUnit(DrawUnit unit, Canvas canvas, Size size) {
    if (unit is Drawer) {
      drawDrawer(unit, canvas, size);
    } else if (unit is DrawTransformer) {
      drawDrawTransformer(unit, canvas, size);
    }
  }

  void drawDrawTransformer(DrawTransformer tran, Canvas canvas, Size size) {
    tran.transform(canvas, size);
    drawUnits(tran.children, canvas, size);
    tran.restore();
  }

  void drawDrawer(Drawer drawer, Canvas canvas, Size size) {
    drawer.paint(canvas, size);
  }

  @override
  bool shouldRepaint(covariant MainWrapper oldDelegate) => false;
}
