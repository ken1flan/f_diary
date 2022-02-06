import 'package:flutter/material.dart';
import 'supports/isar_support.dart';

class TestHelper {
  static void wrapTest(void Function() body) {
    IsarSupport.initilize();

    body();

    IsarSupport.finalize();
  }

  static Widget wrapWithMaterial(Widget widget) {
    return MaterialApp(
      home: widget,
    );
  }
}
