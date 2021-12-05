import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  final DateTime dateTime;

  const ArticlePage(this.dateTime, {Key? key}) : super(key: key);

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<ArticlePage> {
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
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: '内容'),
                  maxLines: 10,
                )
              ],
            )));
  }
}