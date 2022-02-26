import 'package:f_diary/file_converter.dart';
import 'package:flutter_test/flutter_test.dart';

import 'dart:io';

import 'test_helper.dart';

void main() {
  TestHelper.wrapTest(() async {
    group('#fromIsar', () {
      var fileConverter = const FileConverter();
      late String? filePath;

      group('filePath = null のとき', () {
        setUp(() {
          filePath = null;
        });

        test('nullを返すこと', () {
          expect(fileConverter.fromIsar(filePath), equals(null));
        });
      });
      group('filePath = 空文字列 のとき', () {
        setUp(() {
          filePath = '';
        });

        test('nullを返すこと', () {
          expect(fileConverter.fromIsar(filePath), equals(null));
        });
      });
      group('filePath = foo/bar.png のとき', () {
        setUp(() {
          filePath = 'foo/bar.png';
        });

        test('Fileを返すこと', () {
          var file = fileConverter.fromIsar(filePath);
          expect(file, isA<File>());
          expect(file?.path, equals(filePath));
        });
      });
    });
  });
}
