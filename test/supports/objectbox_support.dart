import 'package:f_diary/objectbox.dart';
import 'package:f_diary/models.dart';

class ObjectBoxSupport {
  static void clearAllBox() {
    print('Remove all');
    objectbox.store.box<Article>().removeAll();
    print(objectbox.store.box<Article>().count());
  }

  static void close() {
    objectbox.store.close();
  }
}
