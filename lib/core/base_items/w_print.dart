import 'package:dpro/dpro.dart';
import 'package:dpro_regilo/core/gray_catcher.dart';
import 'package:dpro_regilo/core/unit_unexist_error.dart';
import 'package:flutter/material.dart';

class WPrint extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WPrint();
}

class _WPrint extends State<WPrint> {
  @override
  Widget build(BuildContext context) {
    return Draggable<Widget>(
      // Data is the value this Draggable stores.
      data: CPrint(),
      feedback: style,
      child: style,
      onDragCompleted: () {
        setState(() {});
      },
    );
  }
}

Widget style = Container(
  alignment: Alignment.center,
  height: 51,
  width: 100,
  color: Colors.green,
  child: const Text(
    "出力",
    style: TextStyle(
      fontSize: 21,
      color: Colors.black,
      decoration: TextDecoration.none,
    ),
  ),
);

// ignore: must_be_immutable
class CPrint extends StatefulWidget with DPrint {
  CPrint({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CPrint();

  @override
  DObject get context {
    Object? _context = wContext;
    if (_context != null) {
      if (_context is DObject) {
        return _context;
      }
    }
    throw UnitUnexistError();
  }

  Widget? wContext;
}

class _CPrint extends State<CPrint> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        style,
        widget.wContext ??
            GrayCatcher(onAccept: (w) {
              setState(() {
                widget.wContext = w;
              });
            })
      ],
    );
  }
}
