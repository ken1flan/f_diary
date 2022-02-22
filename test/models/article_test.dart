import 'package:flutter_test/flutter_test.dart';
import 'package:f_diary/common.dart';
import 'package:f_diary/models/article.dart';

import 'package:isar/isar.dart';
import '../test_helper.dart';

void main() {
  TestHelper.wrapTest(() async {
    group('#save', () {
      group('未保存のとき', () {
        DateTime day = DateTime.parse('2022-02-22');

        setUp(() {
          var article = Article()
            ..title = 'タイトルのテスト'
            ..body = '本文のテスト'
            ..postedOn = day
            ..createdAt = DateTime.now()
            ..updatedAt = DateTime.now();
          article.save();
        });

        test('取得し直したarticleに値がが設定されていること', () {
          var savedArticle = isar.articles.where().findFirstSync();
          expect(savedArticle?.title, equals('タイトルのテスト'));
          expect(savedArticle?.body, equals('本文のテスト'));
          expect(savedArticle?.postedOn, equals(day));
        });
      });

      group('保存済のとき', () {
        DateTime day = DateTime.parse('2022-02-22');
        DateTime changedDay = DateTime.parse('2022-02-23');

        setUp(() {
          var article = Article()
            ..title = 'タイトルのテスト'
            ..body = '本文のテスト'
            ..postedOn = day
            ..createdAt = DateTime.now()
            ..updatedAt = DateTime.now();
          article.save();
          var savedArticle = isar.articles.where().findFirstSync();
          savedArticle?.title = '変更 タイトルのテスト';
          savedArticle?.body = '変更 本文のテスト';
          savedArticle?.postedOn = changedDay;
          savedArticle?.save();
        });

        test('取得し直したarticleに値がが設定されていること', () {
          var savedArticle = isar.articles.where().findFirstSync();
          expect(savedArticle?.title, equals('変更 タイトルのテスト'));
          expect(savedArticle?.body, equals('変更 本文のテスト'));
          expect(savedArticle?.postedOn, equals(changedDay));
        });
      });
    });
  });
}
