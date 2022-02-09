import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:f_diary/isar_helper.dart';
import 'package:f_diary/models/article.dart';

import 'package:f_diary/widgets/my_home_page.dart';
import '../test_helper.dart';

void main() {
  TestHelper.wrapTest(() async {
    const myHomePage = MyHomePage(title: 'タイトル');

    group('記事が0個のとき', () {
      testWidgets('「まだありません」と表示されること', (WidgetTester tester) async {
        await tester.pumpWidget(TestHelper.wrapWithMaterial(myHomePage));

        expect(find.text('まだありません。', skipOffstage: false), findsOneWidget);
      });
    });

    group('記事が1個のとき', () {
      final article = Article()
        ..title = '記事のタイトル'
        ..body = '記事の本文'
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now();

      setUp(() {
        isar.writeTxnSync(
            (isar) => {article.id = isar.articles.putSync(article)});
      });

      testWidgets('記事のタイトルが表示されること', (WidgetTester tester) async {
        await tester.pumpWidget(TestHelper.wrapWithMaterial(myHomePage));

        expect(find.text(article.title, skipOffstage: false), findsOneWidget);
      });
    });

    testWidgets('エディットボタンを押したときに記事ページが表示されること', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.wrapWithMaterial(myHomePage));

      await tester.tap(find.byIcon(Icons.edit));
      await tester.pump();

      var dateTime = DateTime.now();
      var titleString = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
      expect(find.text(titleString, skipOffstage: false), findsOneWidget);
    });
  });
}
