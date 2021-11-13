import 'package:flutter/material.dart';
import 'package:f_diary/db_helper.dart';
import 'package:f_diary/widgets/my_home_page.dart';

import 'package:f_diary/models/article.dart';

import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = await openDatabase('my_db.db');
  await DbHelper.initialize();

  var article = Article();
  article.title = 'test title';
  article.body = 'test body';
  var x = await ArticleProvider.insert(article);
  var y = await ArticleProvider.get(x.id!);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'F日記'),
    );
  }
}
