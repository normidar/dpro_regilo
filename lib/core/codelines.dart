import 'package:dpro/dpro.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CodeLines extends StatefulWidget with DCodeLines {
  CodeLines({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _W();

  List<Widget> children = [];
  @override
  // TODO: implement objects
  List<DObject> get objects => throw UnimplementedError();
}

class _W extends State<CodeLines> {
  @override
  Widget build(BuildContext context) {
    final _children = List<Widget>.from(widget.children)
      ..add(DragTarget<Widget>(
        builder: (
          BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,
        ) {
          return Container(
            height: 40.0,
            width: 140.0,
            color: Colors.grey,
          );
        },
        onAccept: (Widget data) {
          setState(() {
            widget.children.add(data);
          });
        },
      ));
    return Column(
      children: _children,
    );
  }
}
