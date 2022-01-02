import 'package:f_diary/objectbox.dart';
import 'package:f_diary/models.dart';

class ObjectBoxSupport {
  static void clearAllBox() {
    objectbox.store.box<Article>().removeAll();
  }
}
