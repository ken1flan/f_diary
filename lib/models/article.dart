import 'package:f_diary/common.dart';
import 'package:isar/isar.dart';
import 'dart:io';
import 'package:f_diary/file_converter.dart';

part 'article.g.dart';

@Collection()
class Article {
  @Id()
  int? id;

  late String title;
  late String body;
  @FileConverter()
  late File? imageFile;
  late DateTime postedOn;
  late DateTime createdAt;
  late DateTime updatedAt;

  void save() {
    updatedAt = DateTime.now();
    isar.writeTxnSync((isar) {
      id = isar.articles.putSync(this);
    });
  }

  void destroy() {
    if (id == null) {
      return;
    } else {
      isar.writeTxnSync((isar) {
        isar.articles.deleteSync(id!);
      });
    }
  }
}
