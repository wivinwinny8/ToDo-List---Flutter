import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

import 'package:hive_flutter/adapters.dart';

class tododata {
  List itemList = [];
  final mybox = Hive.box('myBox');
  void initialValues() {
    itemList = [
      ["Drink water", false],
      ["Eat food", false],
    ];
  }

  void loadValues() {
    itemList = mybox.get("TODOLIST");
  }

  void updateValues() {
    mybox.put("TODOLIST", itemList);
  }

  void clearValues() {
    itemList = [];
  }
}
