import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'supports/common_support.dart';
import 'supports/isar_support.dart';
import 'supports/intl_support.dart';

class TestHelper {
  static void wrapTest(void Function() body) {
    setUpAll(() async {
      CommonSupport.initialize();
      IsarSupport.initilize();
      await IntlSupport.initilize();
    });

    body();

    tearDown(() {
      IsarSupport.finalize();
    });

    tearDownAll(() {
      CommonSupport.finalize();
    });
  }

  static Widget wrapWithMaterial(Widget widget) {
    return MaterialApp(
      home: widget,
    );
  }
}
