import 'package:dpro_regilo/core/base_items/w_print.dart';
import 'package:dpro_regilo/core/base_items/w_string.dart';
import 'package:flutter/material.dart';

class BaseItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Column(
        children: [
          WPrint(),
          const SizedBox(
            height: 10,
          ),
          WString(),
        ],
      ),
    );
  }
}
