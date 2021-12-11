import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _database;

  static initialize() async {
    var path = 'diary.db';
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE articles (
          id integer primary key autoincrement,
          title TEXT,
          body TEXT
        )
      ''');
    });
  }

  static Database get database {
    if (_database == null) {
      initialize();
    }

    return _database!;
  }
}
