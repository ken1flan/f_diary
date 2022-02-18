import 'package:isar/isar.dart';
import 'package:f_diary/common.dart';

part 'article.g.dart';

@Collection()
class Article {
  @Id()
  int? id;

  late String title;
  late String body;
  late String imageFileName;
  late DateTime postedOn;
  late DateTime createdAt;
  late DateTime updatedAt;

  void save() {
    updatedAt = DateTime.now();
    isar.writeTxnSync((isar) {
      id = isar.articles.putSync(this);
    });
  }
}
