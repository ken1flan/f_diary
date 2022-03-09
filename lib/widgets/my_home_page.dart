import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    var articles =
        isar.articles.where(sort: Sort.desc).anyPostedOn().findAllSync();
    Widget body;
    if (articles.isEmpty) {
      body = const Center(child: Text('まだありません。'));
    } else {
      var list = articles.map((Article article) {
        return Card(
          child: InkWell(
            onTap: () {
              _openArticle(article, context);
            },
            onLongPress: () => _deleteArticle(article, context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                article.imageFile == null
                    ? const Image(
                        image: AssetImage('assets/images/1px.png'),
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        article.imageFile!,
                        width: 64,
                        height: 64,
                      ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.yMd('ja').format(article.postedOn),
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    Text(
                      article.title,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                )
              ]),
            ),
          ),
        );
      }).toList();
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
            ..imageFile = null
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

  void _deleteArticle(Article article, BuildContext contex) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            content: Text('「' + article.title + '」を削除しますか？'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('いいえ'),
              ),
              TextButton(
                onPressed: () async {
                  setState(() {
                    article.destroy();
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('はい'),
              )
            ],
          );
        });
  }
}
