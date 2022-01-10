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
import 'package:f_diary/models.dart';
import 'package:f_diary/main.dart';

void main() {
  setUpAll(() async {
    TestHelper.setUpAll();
    objectbox = await ObjectBox.create();
  });

  setUp(() {
    print('set up!!!');
    print(objectbox.store.box<Article>().count());
    print('set up!!!');
  });

  tearDown(() async {
    TestHelper.tearDown();
  });

  tearDownAll(() async {
    TestHelper.tearDownAll();
  });

  group('記事がないとき', () {
    testWidgets('「まだありません。」と表示されること', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      print('hoge!!!');
      print(objectbox.store.box<Article>().count());
      // print(objectbox.store.box<Article>().getAll().first.title);
      // print(objectbox.store.box<Article>().getAll().first.createdAt);
      print('hoge!!!');
      expect(find.text('まだありません。'), findsOneWidget);
    });

    testWidgets('エディットボタンを押すと今日の記事ページが表示されること', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.byIcon(Icons.edit));
      await tester.pump();

      var dateTime = DateTime.now();
      var dateString = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
      expect(find.text(dateString, skipOffstage: false), findsOneWidget);
    });
  });

  group('今日の記事があるとき', () {
    setUp(() {
      final articleBox = objectbox.store.box<Article>();
      final article = Article(
          title: '記事タイトル',
          body: '記事本文記事本文',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
      articleBox.put(article);
    });

    testWidgets('記事のタイトルが表示されること', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('記事タイトル'), findsOneWidget);
    });

    testWidgets('エディットボタンを押すと今日の記事ページが表示されること', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.byIcon(Icons.edit));
      await tester.pump();

      var dateTime = DateTime.now();
      var dateString = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
      expect(find.text(dateString, skipOffstage: false), findsOneWidget);
    });
  });

  group('昨日の記事があるとき', () {
    setUp(() {
      final articleBox = objectbox.store.box<Article>();
      final article = Article(
          title: '記事タイトル',
          body: '記事本文記事本文',
          createdAt: DateTime.now().subtract(const Duration(days: 1)),
          updatedAt: DateTime.now().subtract(const Duration(days: 1)));
      articleBox.put(article);
    });

    testWidgets('記事のタイトルが表示されること', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('記事タイトル'), findsOneWidget);
    });

    testWidgets('エディットボタンを押すと空白の今日の記事ページが表示されること', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.byIcon(Icons.edit));
      await tester.pumpAndSettle();

      var dateTime = DateTime.now();
      var dateString = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
      expect(find.text(dateString, skipOffstage: false), findsOneWidget);
    });
  });

  group('今日と昨日の記事があるとき', () {
    setUp(() {
      final articleBox = objectbox.store.box<Article>();
      final articleToday = Article(
          title: '今日の記事タイトル',
          body: '今日の記事本文記事本文',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
      articleBox.put(articleToday);
      final articleYesterday = Article(
          title: '昨日の記事タイトル',
          body: '昨日の記事本文記事本文',
          createdAt: DateTime.now().subtract(const Duration(days: 1)),
          updatedAt: DateTime.now().subtract(const Duration(days: 1)));
      articleBox.put(articleYesterday);
    });

    testWidgets('記事のタイトルが表示されること', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('今日の記事タイトル'), findsOneWidget);
      expect(find.text('昨日の記事タイトル'), findsOneWidget);
    });

    testWidgets('エディットボタンを押すと記事ページが表示されること', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.byIcon(Icons.edit));
      await tester.pump();

      var dateTime = DateTime.now();
      var dateString = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
      expect(find.text(dateString, skipOffstage: false), findsOneWidget);
    });

    testWidgets('昨日の記事のタイトルをタップすると昨日の記事ページが表示されること',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('昨日の記事タイトル'));
      await tester.pumpAndSettle();

      var dateTime = DateTime.now().subtract(const Duration(days: 1));
      var dateString = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
      expect(find.text(dateString, skipOffstage: false), findsOneWidget);
      // FIXME: 内容についても確認したい
    });

    testWidgets('今日の記事のタイトルをタップすると今日の記事ページが表示されること',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('今日の記事タイトル'));
      await tester.pumpAndSettle();

      var dateTime = DateTime.now();
      var dateString = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
      expect(find.text(dateString, skipOffstage: false), findsOneWidget);
      // FIXME: 内容についても確認したい
    });
  });

  tearDownAll(() {});
}
