import 'package:dpro_regilo/core/base_items/branch/w_if.dart';
import 'package:dpro_regilo/core/base_items/item_list/base_item_list.dart';
import 'package:flutter/src/widgets/framework.dart';

class BranchItemList extends BaseItemList {
  @override
  List<Widget> getChildren() {
    return [
      WIf(),
    ];
  }
}
