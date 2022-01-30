import 'package:dpro/dpro.dart';
import 'package:dpro_regilo/core/base_items/value/value_container_wrap.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class WBool extends StatefulWidget with DBool {
  WBool({Key? key, this.value = true}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WString();

  @override
  bool value;
}

class _WString extends State<WBool> {
  @override
  Widget build(BuildContext context) {
    Widget style = ValueContainerWrap(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.value ? "true" : "false",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ).tr(),
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
      data: WBool(
        value: widget.value,
      ),
      onDragStarted: () {
        setState(() {});
      },
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
