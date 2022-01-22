import 'package:dpro/dpro.dart';
import 'package:dpro_regilo/core/gray_catcher.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CodeLines extends StatefulWidget with DCodeLines {
  CodeLines({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _W();

  List<Widget> children = [];
  @override
  List<DObject> get objects {
    List<DObject> result = [];
    for (Object child in children) {
      if (child is DObject) {
        result.add(child);
      }
    }
    return result;
  }
}

class _W extends State<CodeLines> {
  @override
  Widget build(BuildContext context) {
    final _children = List<Widget>.from(widget.children)
      ..add(
        GrayCatcher(onAccept: (w) {
          setState(() {
            widget.children.add(w);
          });
        }),
      );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _children,
    );
  }
}
