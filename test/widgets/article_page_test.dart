import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:f_diary/common.dart';
import 'package:f_diary/models/article.dart';

import 'package:isar/isar.dart';
import 'package:f_diary/widgets/article_page.dart';
import '../test_helper.dart';

void main() {
  TestHelper.wrapTest(() async {
    group('未保存の記事を指定されたとき', () {
      var article = Article()
        ..title = ''
        ..body = ''
        ..imageFile = null
        ..postedOn = DateTime.now()
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now();

      var articlePage = ArticlePage(article);

      testWidgets('ページが表示されること', (WidgetTester tester) async {
        await tester.pumpWidget(TestHelper.wrapWithMaterial(articlePage));

        expect(find.text('記事の編集', skipOffstage: false), findsOneWidget);
        var savedArticle = isar.articles.where().findFirstSync();
        expect(savedArticle, equals(null));
      });

      testWidgets('記入後に自動的に保存されていること', (WidgetTester tester) async {
        await tester.pumpWidget(TestHelper.wrapWithMaterial(articlePage));
        await tester.enterText(
            find.byKey(const ValueKey('articleTitleTextField')), '記事のタイトル');
        await tester.enterText(
            find.byKey(const ValueKey('articleBodyTextField')), '記事の本文');
        var savedArticle = isar.articles.where().findFirstSync();
        expect(savedArticle?.title, equals('記事のタイトル'));
        expect(savedArticle?.body, equals('記事の本文'));
      });
    });
  });

  group('既存の記事を指定されたとき', () {
    var article = Article()
      ..title = '記事のタイトル'
      ..body = '記事の本文'
      ..imageFile = null
      ..postedOn = DateTime.now()
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    var articlePage = ArticlePage(article);

    testWidgets('ページが表示されること', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.wrapWithMaterial(articlePage));

      expect(find.text('記事のタイトル'), findsOneWidget);
      expect(find.text('記事の本文'), findsOneWidget);
    });

    testWidgets('変更後に自動的に保存されていること', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.wrapWithMaterial(articlePage));
      await tester.enterText(
          find.byKey(const ValueKey('articleTitleTextField')), '変更後の記事のタイトル');
      await tester.enterText(
          find.byKey(const ValueKey('articleBodyTextField')), '変更後の記事の本文');
      var savedArticle = isar.articles.where().findFirstSync();
      expect(savedArticle?.title, equals('変更後の記事のタイトル'));
      expect(savedArticle?.body, equals('変更後の記事の本文'));
    });
  });
}
