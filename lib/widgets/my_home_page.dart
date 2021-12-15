import 'package:flutter/material.dart';
import 'package:f_diary/widgets/article_page.dart';
import 'package:f_diary/objectbox.dart';
import 'package:f_diary/models.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Article> articles = objectbox.store.box<Article>().getAll();
    late Widget body;
    if (articles.isEmpty) {
      body = const Center(child: Text('まだありません。'));
    } else {
      var list = articles
          .map((Article article) => Card(
                child: InkWell(
                  onTap: () {
                    _editArticle(context, article);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(article.title ?? ''),
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
          _openArticle(context);
        },
        tooltip: 'Open article',
        child: const Icon(Icons.edit),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _openArticle(BuildContext context) async {
    var article = Article(createdAt: DateTime.now(), updatedAt: DateTime.now());
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticlePage(article),
        ));
    setState(() {});
  }

  void _editArticle(BuildContext context, Article article) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticlePage(article),
        ));
    setState(() {});
  }
}
