import 'package:isar/isar.dart';
import 'dart:io';
import 'package:f_diary/common.dart';

class IsarSupport {
  static void initilize() {
    var directory = "${Directory.current.path}/tmp";
    isar = Isar.openSync(schemas: Common.schemas, directory: directory);
  }

  static void finalize() {
    isar.writeTxnSync((isar) {
      isar.clearSync();
    });
  }
}
