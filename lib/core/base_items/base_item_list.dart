import 'package:dpro_regilo/core/darg.dart';
import 'package:flutter/material.dart';

class BaseItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Column(
        children: const [
          Darg(),
          SizedBox(
            height: 10,
          ),
          Darg(),
        ],
      ),
    );
  }
}
