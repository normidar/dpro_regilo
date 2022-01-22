import 'package:flutter/material.dart';

class Target extends StatefulWidget {
  const Target({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Target();
}

class _Target extends State<Target> {
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return DragTarget<Widget>(
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) {
        return child ??
            Container(
              height: 100.0,
              width: 100.0,
              color: Colors.cyan,
              child: const Center(
                child: Text('Value is updated'),
              ),
            );
      },
      onAccept: (Widget data) {
        setState(() {
          child = data;
        });
      },
    );
  }
}
