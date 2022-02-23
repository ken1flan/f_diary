import 'dart:io';
import 'package:isar/isar.dart';

class FileConverter extends TypeConverter<File, String> {
  @override
  // ignore: avoid_renaming_method_parameters
  File fromIsar(String filePath) {
    return File(filePath);
  }

  @override
  // ignore: avoid_renaming_method_parameters
  String toIsar(File file) {
    return file.path;
  }
}
