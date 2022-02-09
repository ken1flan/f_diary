import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:f_diary/models/article.dart';

late Isar isar;

class IsarHelper {
  static var schemas = [ArticleSchema];

  static Future<void> initialize() async {
    isar = await Isar.open(
      schemas: schemas,
      directory: (await getApplicationDocumentsDirectory()).path,
    );
  }

  // 書き込み確認
  static void addSampleArticle() {
    final article = Article()
      ..title = 'test title'
      ..body = 'test body'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();
    isar.writeTxnSync((isar) => {article.id = isar.articles.putSync(article)});
    // final allArticles = isar.articles.where().findAllSync();
  }
}
