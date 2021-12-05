import 'package:flutter/material.dart';
import 'package:f_diary/models/article.dart';

class ArticlePage extends StatefulWidget {
  final DateTime dateTime;

  const ArticlePage(this.dateTime, {Key? key}) : super(key: key);

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<ArticlePage> {
  Article article = Article();

  _ArticleState();

  @override
  Widget build(BuildContext contest) {
    var dateTime = widget.dateTime;
    var titleString = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    return Scaffold(
        appBar: AppBar(title: Text(titleString)),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'タイトル', hintText: '今日をひとことでいうとなんですか？'),
                  onChanged: (value) async {
                    article.title = value;
                    article = await ArticleProvider.save(article);
                    setState(() {});
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: '本文'),
                  maxLines: 10,
                  onChanged: (value) async {
                    article.body = value;
                    article = await ArticleProvider.save(article);
                    setState(() {});
                  },
                )
              ],
            )));
  }
}
