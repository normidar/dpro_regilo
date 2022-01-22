import 'package:flutter/material.dart';

class OutputPage extends StatelessWidget {
  String code;
  OutputPage({
    Key? key,
    required this.code,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("the code output"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Text(code),
        ),
      ),
    );
  }
}
