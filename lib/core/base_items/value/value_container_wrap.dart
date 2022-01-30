import 'package:flutter/material.dart';

class ValueContainerWrap extends StatelessWidget {
  final Widget child;

  const ValueContainerWrap({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 51,
      width: 100,
      color: Colors.green[100],
      child: child,
    );
  }
}
