import 'package:isar/isar.dart';
import 'package:f_diary/common.dart';

class IsarSupport {
  static void initilize() {
    isar = Isar.openSync(schemas: Common.schemas, directory: applicationDocumentsDirectory.path);
  }

  static void finalize() {
    isar.writeTxnSync((isar) {
      isar.clearSync();
    });
  }
}
