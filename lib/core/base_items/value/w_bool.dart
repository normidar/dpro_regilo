import 'package:dpro/dpro.dart';
import 'package:flutter/material.dart';

class WBool extends StatefulWidget with DBool {
  @override
  State<StatefulWidget> createState() => _WString();

  @override
  bool value = true;
}

class _WString extends State<WBool> {
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
          Text(
            widget.value ? "真" : "偽",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.switch_left,
              size: 16,
            ),
            onPressed: () {
              setState(() {
                widget.value = !widget.value;
              });
            },
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
