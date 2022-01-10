import 'package:flutter/material.dart';

class TestHelper {
  static Widget wrapWithMaterial(Widget widget) {
    return MaterialApp(
      home: widget,
    );
  }
}
