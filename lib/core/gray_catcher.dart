import 'package:flutter/material.dart';

typedef DragTargetAccept<T> = void Function(T data);

class GrayCatcher extends StatelessWidget {
  final DragTargetAccept<Widget> onAccept;
  const GrayCatcher({
    Key? key,
    required this.onAccept,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<Widget>(
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
      onAccept: onAccept,
    );
  }
}
