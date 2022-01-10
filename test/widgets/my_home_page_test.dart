import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:f_diary/widgets/my_home_page.dart';

import '../test_helper.dart';

void main() {
  const myHomePage = MyHomePage(title: 'タイトル');

  testWidgets('エディットボタンを押したときに記事ページが表示されること', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.wrapWithMaterial(myHomePage));

    await tester.tap(find.byIcon(Icons.edit));
    await tester.pump();

    var dateTime = DateTime.now();
    var titleString = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    expect(find.text(titleString, skipOffstage: false), findsOneWidget);
  });
}
