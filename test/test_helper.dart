import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'supports/isar_support.dart';

class TestHelper {
  static void wrapTest(void Function() body) {
    setUpAll(() {
      IsarSupport.initilize();
    });

    body();

    tearDown(() {
      IsarSupport.finalize();
    });
  }

  static Widget wrapWithMaterial(Widget widget) {
    return MaterialApp(
      home: widget,
    );
  }
}
