import 'package:dpro/dpro.dart';
import 'package:dpro_regilo/core/base_items/value/value_container_wrap.dart';
import 'package:flutter/material.dart';

class WInt extends StatefulWidget with DInt {
  @override
  int value = 1;

  WInt({Key? key, int? value}) : super(key: key) {
    if (value != null) this.value = value;
  }

  @override
  State<StatefulWidget> createState() => _WString();
}

class _WString extends State<WInt> {
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
                        widget.value = int.parse(str);
                      });
                    },
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      hintText: widget.value.toString(),
                    ),
                  ),
                )
              : Text(
                  widget.value.toString(),
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
      data: WInt(
        value: widget.value,
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
