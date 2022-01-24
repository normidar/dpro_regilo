import 'package:dpro/dpro.dart';
import 'package:dpro_regilo/core/codelines.dart';
import 'package:dpro_regilo/core/gray_catcher.dart';
import 'package:flutter/material.dart';

class WIf extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WIf();
}

class _WIf extends State<WIf> {
  @override
  Widget build(BuildContext context) {
    return Draggable<Widget>(
      // Data is the value this Draggable stores.
      data: CIf(),
      feedback: styleIf,
      child: styleIf,
      onDragCompleted: () {
        setState(() {});
      },
    );
  }
}

Widget styleIf = Container(
  alignment: Alignment.center,
  height: 51,
  width: 100,
  color: Colors.green,
  child: const Text(
    "もし",
    style: TextStyle(
      fontSize: 21,
      color: Colors.black,
      decoration: TextDecoration.none,
    ),
  ),
);

// ignore: must_be_immutable
class CIf extends StatefulWidget with DIf {
  CIf({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CIf();

  Widget? wCondition;

  @override
  DObject get condition {
    if (wCondition != null) {
      return wCondition as DObject;
    }
    throw Exception();
  }

  @override
  DCodeLines? get elseLines => null;

  @override
  DCodeLines get lines {
    Object _lines = wLines;
    return _lines as DCodeLines;
  }

  Widget wLines = CodeLines();
}

class _CIf extends State<CIf> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          styleIf,
          widget.wCondition ??
              GrayCatcher(
                onAccept: (w) {
                  setState(() {
                    widget.wCondition = w;
                  });
                },
                width: 30,
              ),
          Container(
            alignment: Alignment.center,
            height: 51,
            width: 100,
            color: Colors.green,
            child: const Text(
              "の時に:",
              style: TextStyle(
                fontSize: 21,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
          )
        ],
      ),
      Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          widget.wLines,
        ],
      )
    ]);
  }
}
