import 'package:dpro/dpro.dart';
import 'package:flutter/material.dart';

class WString extends StatefulWidget with DString {
  @override
  String value = "文字列";

  @override
  State<StatefulWidget> createState() => _WString();
}

class _WString extends State<WString> {
  @override
  Widget build(BuildContext context) {
    Widget style = Container(
      alignment: Alignment.center,
      height: 51,
      width: 100,
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "文字列",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.edit,
              size: 16,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
    return Draggable<Widget>(
      // Data is the value this Draggable stores.
      data: widget,
      feedback: Material(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
          child: style,
        ),
        elevation: 4.0,
      ),
      child: style,
    );
  }
}
