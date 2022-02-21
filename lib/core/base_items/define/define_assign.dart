import 'package:dpro/dpro.dart';
import 'package:dpro_regilo/core/codelines.dart';
import 'package:dpro_regilo/core/gray_catcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WDefineAssign extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WDefineAssign();
}

class _WDefineAssign extends State<WDefineAssign> {
  @override
  Widget build(BuildContext context) {
    return Draggable<Widget>(
      // Data is the value this Draggable stores.
      data: CDefineAssign(),
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
  child: Text(
    "define_assign".tr(),
    style: const TextStyle(
      fontSize: 21,
      color: Colors.black,
      decoration: TextDecoration.none,
    ),
  ),
);

// ignore: must_be_immutable
class CDefineAssign extends StatefulWidget with DefGive {
  CDefineAssign({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CDefineAssign();

  Widget wLines = CodeLines();

  @override
  DObject get content {
    if (wContent != null) {
      return wContent as DObject;
    }
    throw Exception();
  }

  Widget? wContent;

  @override
  DObject get target {
    if (wTarget != null) {
      return wTarget as DObject;
    }
    throw Exception();
  }

  Widget? wTarget;

  @override
  DType? get type => null;
}

class _CDefineAssign extends State<CDefineAssign> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.wTarget ??
            GrayCatcher(
              onAccept: (w) {
                setState(() {
                  widget.wTarget = w;
                });
              },
              width: 50,
            ),
        Container(
          alignment: Alignment.center,
          height: 51,
          width: 100,
          color: Colors.green,
          child: const Text(
            "<-:",
            style: TextStyle(
              fontSize: 21,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        widget.wContent ??
            GrayCatcher(
              onAccept: (w) {
                setState(() {
                  widget.wContent = w;
                });
              },
              width: 50,
            ),
      ],
    );
  }
}
