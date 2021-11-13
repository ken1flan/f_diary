import 'package:sqflite/sqflite.dart';
import 'package:f_diary/db_helper.dart';

class Article {
  int? id;
  String? title;
  String? body;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      'title': title,
      'body': body,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  Article();

  Article.fromMap(Map<String, Object?> map) {
    id = map['id'] as int;
    title = map['title'] as String;
    body = map['body'] as String;
  }
}

class ArticleProvider {
  static Database db = DbHelper.database;

  ArticleProvider();

  static Future<Article> save(Article article) async {
    return article.id == null ? _insert(article) : _update(article);
  }

  static Future<Article> _insert(Article article) async {
    article.id = await db.insert('articles', article.toMap());
    return article;
  }

  static Future<Article> _update(Article article) async {
    await db.update('articles', article.toMap(),
        where: 'id = ?', whereArgs: [article.id]);
    return article;
  }

  static Future<Article?> get(int id) async {
    List<Map<String, Object?>> maps = await db.query('articles',
        columns: ['id', 'title', 'body'], where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Article.fromMap(maps.first);
    }
    return null;
  }
}
