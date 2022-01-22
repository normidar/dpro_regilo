import 'package:flutter/material.dart';

class Darg extends StatefulWidget {
  const Darg({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Darg();
}

class _Darg extends State<Darg> {
  @override
  Widget build(BuildContext context) {
    return Draggable<Widget>(
      // Data is the value this Draggable stores.
      data: Container(
        height: 50,
        width: 100,
        color: Colors.green,
      ),
      feedback: Container(
        color: Colors.deepOrange,
        height: 100,
        width: 100,
        child: const Icon(Icons.directions_run),
      ),
      childWhenDragging: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.pinkAccent,
        child: const Center(
          child: Text('Child When Dragging'),
        ),
      ),
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.lightGreenAccent,
        child: const Center(
          child: Text('Draggable'),
        ),
      ),
    );
  }
}
