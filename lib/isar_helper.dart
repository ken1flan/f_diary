import 'package:isar/isar.dart';
import 'package:isar_connect/isar_connect.dart';
import 'package:path_provider/path_provider.dart';
import 'package:f_diary/models/article.dart';

late Isar isar;

class IsarHelper {
  static Future<void> initialize() async {
    initializeIsarConnect();
    isar = await Isar.open(
      schemas: [ArticleSchema],
      directory: (await getApplicationDocumentsDirectory()).path,
    );
  }
}
