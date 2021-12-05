import 'package:flutter/material.dart';
import 'package:f_diary/widgets/article_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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

  void _openArticle(BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticlePage(DateTime.now()),
        ));
    setState(() {});
  }
}
