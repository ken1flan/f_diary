// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helper.dart';

import 'package:f_diary/objectbox.dart';
import 'package:f_diary/main.dart';

void main() {
  setUpAll(() async {
    TestHelper.setUpAll();
    objectbox = await ObjectBox.create();
  });

  testWidgets('エディットボタンを押したときに記事ページが表示されること', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.edit));
    await tester.pump();

    var dateTime = DateTime.now();
    var titleString = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    expect(find.text(titleString, skipOffstage: false), findsOneWidget);
  });

  tearDownAll(() {});
}
