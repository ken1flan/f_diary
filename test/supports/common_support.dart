import 'dart:io';
import 'package:f_diary/common.dart';

class CommonSupport {
  static void initialize() {
    applicationDocumentsDirectory =
        Directory("${Directory.current.path}/tmp/$pid");
    applicationDocumentsDirectory.createSync(recursive: true);
  }

  static void finalize() {
    applicationDocumentsDirectory.deleteSync(recursive: true);
  }
}
