import 'package:dpro_regilo/core/base_items/define/define_assign.dart';
import 'package:dpro_regilo/core/base_items/item_list/base_item_list.dart';
import 'package:dpro_regilo/core/base_items/value/w_bool.dart';
import 'package:dpro_regilo/core/base_items/value/w_float.dart';
import 'package:dpro_regilo/core/base_items/value/w_int.dart';
import 'package:dpro_regilo/core/base_items/value/w_print.dart';
import 'package:dpro_regilo/core/base_items/value/w_string.dart';
import 'package:dpro_regilo/core/base_items/value/w_variable.dart';
import 'package:flutter/src/widgets/framework.dart';

class ValueItemList extends BaseItemList {
  @override
  List<Widget> getChildren() {
    return [
      WBool(),
      WString(),
      WInt(),
      WFloat(),
      WDefineAssign(),
      WVariable(),
      WPrint(),
    ];
  }
}
