import 'package:f_diary/isar_helper.dart';
import 'package:flutter/material.dart';
import 'package:f_diary/models/article.dart';

class ArticlePage extends StatefulWidget {
  final Article article;

  const ArticlePage(this.article, {Key? key}) : super(key: key);

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<ArticlePage> {
  _ArticleState();

  @override
  Widget build(BuildContext contest) {
    var article = widget.article;
    var dateTime = article.createdAt;
    var titleString = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    return Scaffold(
        appBar: AppBar(title: Text(titleString)),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                TextFormField(
                  initialValue: article.title,
                  decoration: const InputDecoration(
                      labelText: 'タイトル', hintText: '今日をひとことでいうとなんですか？'),
                  onChanged: (value) {
                    article.title = value;
                    article.updatedAt = DateTime.now();
                    isar.writeTxnSync((isar) {
                      article.id = isar.articles.putSync(article);
                    });
                  },
                ),
                TextFormField(
                  initialValue: article.body,
                  decoration: const InputDecoration(labelText: '内容'),
                  maxLines: 10,
                  onChanged: (value) {
                    article.body = value;
                    article.updatedAt = DateTime.now();
                    isar.writeTxnSync((isar) {
                      article.id = isar.articles.putSync(article);
                    });
                  },
                )
              ],
            )));
  }
}
