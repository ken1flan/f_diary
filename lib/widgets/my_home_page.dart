import 'package:flutter/material.dart';
import 'package:f_diary/widgets/article_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(DateTime.now().toString()),
      ),
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
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticlePage(DateTime.now()),
        ));
  }
}
