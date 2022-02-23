import 'dart:io';
import 'package:crypto/crypto.dart' as crypto;
import 'package:isar/isar.dart';
import 'package:f_diary/common.dart';

class FileConverter extends TypeConverter<File, String> {
  const FileConverter();

  @override
  // ignore: avoid_renaming_method_parameters
  File fromIsar(String filePath) {
    return File(filePath);
  }

  @override
  // ignore: avoid_renaming_method_parameters
  String toIsar(File file) {
    var digest = crypto.md5.convert(file.readAsBytesSync());
    var orgFileName = file.path.split('/').last;
    var nameArray = orgFileName.split('.');
    var newFileName =
        nameArray.length < 2 ? digest : digest + nameArray.sublist(1).join('.');
    var newFilePath = baseDir.path + '/' + newFileName;
    var existFile = File(newFilePath);
    if (existFile.existsSync()) {
      existFile.deleteSync();
    }
    var newFile = file.copySync(newFilePath);
    return newFile.path;
  }

  Directory get baseDir {
    var baseDir = Directory(applicationDocumentsDirectory.path + '/files');
    if (!baseDir.existsSync()) {
      baseDir.createSync(recursive: true);
    }
    return baseDir;
  }
}
