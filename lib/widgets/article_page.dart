import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:f_diary/objectbox.dart';
import 'package:f_diary/models.dart';

class ArticlePage extends StatefulWidget {
  // final DateTime dateTime;
  final Article article;

  const ArticlePage(this.article, {Key? key}) : super(key: key);

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<ArticlePage> {
  late final Box<Article> box;
  late Article article;

  _ArticleState() {
    box = objectbox.store.box<Article>();
  }

  @override
  Widget build(BuildContext contest) {
    article = widget.article;
    var dateTime = article.createdAt ?? DateTime.now();
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
                    save();
                  },
                ),
                TextFormField(
                  initialValue: article.body,
                  decoration: const InputDecoration(labelText: '内容'),
                  minLines: 10,
                  maxLines: null,
                  onChanged: (value) {
                    article.body = value;
                    save();
                  },
                ),
              ],
            )));
  }

  void save() {
    box.put(article);
  }
}
