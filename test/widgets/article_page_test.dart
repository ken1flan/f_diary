import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../test_helper.dart';

import 'package:f_diary/objectbox.dart';
import 'package:f_diary/models.dart';
import 'package:f_diary/widgets/article_page.dart';

void main() {
  setUpAll(() async {
    TestHelper.setUpAll();
    objectbox = await ObjectBox.create();
  });

  tearDown(() async {
    TestHelper.tearDown();
  });

  group('未保存の記事のとき', () {
    late ArticlePage articlePage;
    var articleTitle = '記事のタイトル';
    var articleBody = '記事の本文';

    setUp(() {
      var article =
          Article(createdAt: DateTime.now(), updatedAt: DateTime.now());
      var box = objectbox.store.box<Article>();
      box.put(article);
      articlePage = ArticlePage(article);
    });
    testWidgets('今日の日付で内容が保存されていること', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.wrapWithMaterial(articlePage));

      var dateTime = DateTime.now();
      var dateString = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
      expect(find.text(dateString, skipOffstage: false), findsOneWidget);

      await tester.enterText(
          find.byKey(const ValueKey('titleTextField')), articleTitle);
      await tester.enterText(
          find.byKey(const ValueKey('bodyTextField')), articleBody);

      final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
      await widgetsAppState.didPopRoute();
      await tester.pump();

      expect(find.text(articleTitle, skipOffstage: false), findsOneWidget);

      var article = objectbox.store.box<Article>().getAll().first;
      expect(article.title, articleTitle);
      expect(article.body, articleBody);
    });
  });

  group('既存の記事のとき', () {
    late ArticlePage articlePage;
    var articleTitle = '変更後の記事のタイトル';
    var articleBody = '変更後の記事の本文';

    setUp(() {
      var article = Article(
          title: '変更前の記事のタイトル',
          body: '変更前の記事の本文',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
      var box = objectbox.store.box<Article>();
      box.put(article);
      articlePage = ArticlePage(article);
    });

    testWidgets('内容が更新されていること', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.wrapWithMaterial(articlePage));

      var dateTime = DateTime.now();
      var dateString = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
      expect(find.text(dateString, skipOffstage: false), findsOneWidget);

      await tester.enterText(
          find.byKey(const ValueKey('titleTextField')), articleTitle);
      await tester.enterText(
          find.byKey(const ValueKey('bodyTextField')), articleBody);

      final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
      await widgetsAppState.didPopRoute();
      await tester.pump();

      expect(find.text(articleTitle, skipOffstage: false), findsOneWidget);

      var article = objectbox.store.box<Article>().getAll().first;
      expect(article.title, articleTitle);
      expect(article.body, articleBody);
    });
  });
}
