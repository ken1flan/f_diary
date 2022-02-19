import 'package:f_diary/common.dart';
import 'package:isar/isar.dart';
import 'dart:io';

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

  void storeImage(File file) {
    if (!imageDir.existsSync()) {
      imageDir.createSync();
    }
    String fileName = file.path.split('/').last;
    imageFileName = imageDir.path + '/' + fileName;
    imageFile.copySync(imageFileName);
  }

  Directory get imageDir {
    return Directory(applicationDocumentsDirectory.path +
        '/images/articles/' +
        id.toString());
  }

  String get imagePath {
    // TODO
    return 'imagePath';
  }

  File get imageFile {
    // TODO
    return File(imagePath);
  }
}
