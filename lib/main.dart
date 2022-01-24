import 'package:dpro_regilo/core/base_items/base_item_list.dart';
import 'package:dpro_regilo/core/codelines.dart';
import 'package:dpro_regilo/output/output_page.dart';
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
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  final CodeLines _codeLines = CodeLines();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("dproサンプル"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return OutputPage(
                  codeLines: _codeLines,
                );
              }));
            },
            icon: const Icon(Icons.arrow_forward),
          )
        ],
      ),
      body: Container(
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
                    child: _codeLines,
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
      ),
    );
  }
}
