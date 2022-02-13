import 'package:isar/isar.dart';

part 'article.g.dart';

@Collection()
class Article {
  @Id()
  int? id;

  late String title;
  late String body;
  late DateTime postedOn;
  late DateTime createdAt;
  late DateTime updatedAt;
}
