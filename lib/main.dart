import 'package:dpro_regilo/core/base_items/base_item_list.dart';
import 'package:dpro_regilo/core/codelines.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int acceptedData = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 3,
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Container(
                alignment: Alignment.topLeft,
                color: Colors.green[100],
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: CodeLines(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Container(
                color: Colors.blue[200],
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: BaseItemList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
