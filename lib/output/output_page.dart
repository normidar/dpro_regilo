import 'package:dpro/dpro.dart';
import 'package:dpro_regilo/core/codelines.dart';
import 'package:flutter/material.dart';

class OutputPage extends StatelessWidget {
  CodeLines codeLines;
  OutputPage({
    Key? key,
    required this.codeLines,
  }) : super(key: key) {
    TranEngine.tip = LanguageTips.python;
    pythonCode = TranEngine.tran(
      codes: codeLines,
    );
    TranEngine.tip = LanguageTips.java;
    javaCode = TranEngine.tran(
      codes: codeLines,
    );
  }
  late String pythonCode;
  late String javaCode;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("the code output"),
          bottom: const TabBar(
            indicator: BoxDecoration(color: Colors.lightBlue),
            tabs: [
              Tab(text: 'Python'),
              Tab(text: 'Java'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Text(pythonCode),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Text(javaCode),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
