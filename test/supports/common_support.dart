import 'dart:io';
import 'package:f_diary/common.dart';

class CommonSupport {
  static void initialize() {
    applicationDocumentsDirectory = Directory("${Directory.current.path}/tmp");
  }
}