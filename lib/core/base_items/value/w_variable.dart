import 'package:dpro/dpro.dart';
import 'package:dpro_regilo/core/base_items/value/value_container_wrap.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class WVariable extends StatefulWidget with DVar {
  WVariable({Key? key, String? name}) : super(key: key) {
    if (name != null) this.name = name;
  }

  @override
  State<StatefulWidget> createState() => _WVariable();

  @override
  String name = "variable".tr();
}

class _WVariable extends State<WVariable> {
  bool _isEditing = false;
  @override
  Widget build(BuildContext context) {
    Widget style = ValueContainerWrap(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _isEditing
              ? SizedBox(
                  width: 50,
                  height: 40,
                  child: TextField(
                    autofocus: true,
                    textInputAction: TextInputAction.go,
                    onSubmitted: (str) {
                      setState(() {
                        _isEditing = false;
                        widget.name = str;
                      });
                    },
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      hintText: widget.name,
                    ),
                  ),
                )
              : Text(
                  widget.name,
                  style: const TextStyle(
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
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
            },
          )
        ],
      ),
    );
    return Draggable<Widget>(
      // Data is the value this Draggable stores.
      data: WVariable(
        name: widget.name,
      ),
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
