import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text('Hello!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openArticle();
        },
        tooltip: 'Open article',
        child: const Icon(Icons.edit),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _openArticle() {
    // 記事ページを開く
  }
}
