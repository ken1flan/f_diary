import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:f_diary/isar_helper.dart';
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
  Widget build(BuildContext context) {
    var article = widget.article;
    var dateTime = article.createdAt;
    var titleString = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    return Scaffold(
        appBar: AppBar(title: Text(titleString)),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                InkWell(
                  child: Text(
                      '投稿日 ' + DateFormat.yMd('ja').format(article.postedOn)),
                  onTap: () async {
                    DateTime? picked = await _selectDate(article, context);
                    if (picked != null) {
                      setState(() {
                        article.postedOn = picked;
                        _saveArticle(article);
                      });
                    }
                  },
                ),
                TextFormField(
                  initialValue: article.title,
                  key: const ValueKey('articleTitleTextField'),
                  decoration: const InputDecoration(
                      labelText: 'タイトル', hintText: '今日をひとことでいうとなんですか？'),
                  onChanged: (value) {
                    article.title = value;
                    _saveArticle(article);
                  },
                ),
                TextFormField(
                  initialValue: article.body,
                  key: const ValueKey('articleBodyTextField'),
                  decoration: const InputDecoration(labelText: '内容'),
                  maxLines: 10,
                  onChanged: (value) {
                    article.body = value;
                    _saveArticle(article);
                  },
                ),
              ],
            )));
  }

  void _saveArticle(Article article) {
    article.updatedAt = DateTime.now();
    isar.writeTxnSync((isar) {
      article.id = isar.articles.putSync(article);
    });
  }

  Future<DateTime?> _selectDate(Article article, BuildContext context) async {
    DateTime initialDate = article.postedOn;
    DateTime firstDate = DateTime.now().add(const Duration(days: -360));
    DateTime lastDate = DateTime.now().add(const Duration(days: 360));
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate);
    return picked;
  }
}
