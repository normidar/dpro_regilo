import 'package:flutter/material.dart';

abstract class BaseItemList extends StatelessWidget {
  List<Widget> getChildren();
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Column(
        children: getChildren().map(mapChildren).toList(),
      ),
    );
  }

  Widget mapChildren(Widget child) {
    return Column(
      children: [
        child,
        const SizedBox(height: 10),
      ],
    );
  }
}
