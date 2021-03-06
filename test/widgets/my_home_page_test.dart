import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:f_diary/common.dart';
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
        ..imageFile = null
        ..postedOn = DateTime.now()
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

      testWidgets('タイトルをタップしたときに記事ページが表示されること', (WidgetTester tester) async {
        await tester.pumpWidget(TestHelper.wrapWithMaterial(myHomePage));

        await tester.tap(find.text(article.title));
        await tester.pumpAndSettle();

        expect(find.text(article.title), findsOneWidget);
        expect(find.text(article.body), findsOneWidget);
      });

      testWidgets('タイトルを長押したときに記事を削除できること', (WidgetTester tester) async {
        await tester.pumpWidget(TestHelper.wrapWithMaterial(myHomePage));
        await tester.longPress(find.text(article.title));
        await tester.pump();

        await tester.tap(find.text('はい'));
        await tester.pump();

        expect(find.text('まだありません。'), findsOneWidget);
      });
    });

    testWidgets('エディットボタンを押したときに記事ページが表示されること', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.wrapWithMaterial(myHomePage));

      await tester.tap(find.byIcon(Icons.edit));
      await tester.pump();

      expect(find.text('記事の編集', skipOffstage: false), findsOneWidget);
    });
  });
}
