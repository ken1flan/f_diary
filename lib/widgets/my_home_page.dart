import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:f_diary/common.dart';
import 'package:f_diary/models/article.dart';
import 'package:f_diary/widgets/article_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var articles = isar.articles.where().findAllSync();
    Widget body;
    if (articles.isEmpty) {
      body = const Center(child: Text('まだありません。'));
    } else {
      var list = articles
          .map((Article article) => Card(
                child: InkWell(
                  onTap: () {
                    _openArticle(article, context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(article.title),
                  ),
                ),
              ))
          .toList();
      body = ListView(children: list);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var article = Article()
            ..title = ''
            ..body = ''
            ..imageFileName = ''
            ..postedOn = DateTime.now()
            ..createdAt = DateTime.now()
            ..updatedAt = DateTime.now();
          _openArticle(article, context);
        },
        tooltip: 'Open article',
        child: const Icon(Icons.edit),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _openArticle(Article article, BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticlePage(article),
        ));
    setState(() {});
  }
}
