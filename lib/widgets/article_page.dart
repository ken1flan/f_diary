import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

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
                        article.save();
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
                    article.save();
                  },
                ),
                TextFormField(
                  initialValue: article.body,
                  key: const ValueKey('articleBodyTextField'),
                  decoration: const InputDecoration(labelText: '内容'),
                  maxLines: 10,
                  onChanged: (value) {
                    article.body = value;
                    article.save();
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 0),
                  child: SizedBox(width: 300, child: Text('画像が選択されていません。')),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder()),
                        child: const Icon(Icons.add_a_photo)),
                    OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder()),
                        child: const Icon(Icons.photo_library)),
                  ],
                )
              ],
            )));
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
