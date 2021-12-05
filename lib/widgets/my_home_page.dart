import 'package:f_diary/models/article.dart';
import 'package:flutter/material.dart';
import 'package:f_diary/widgets/article_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Widget body = const Center(child: Text('まだありません'));

    body = FutureBuilder(
      future: ArticleProvider.getAll(),
      builder: (context, AsyncSnapshot<List<Article>?> snapshot) {
        List<Article>? articles = snapshot.data;
        if (articles == null) {
          return const Center(child: Text('まだありません'));
        } else {
          var list = articles
              .map((Article article) => Card(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(article.title ?? ''),
                  )))
              .toList();
          return ListView(children: list);
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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

  void _openArticle(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        ArticlePage(DateTime.now());
      },
    ));
  }
}
