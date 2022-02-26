import 'package:flutter/material.dart';

import 'dart:io';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

import 'package:f_diary/models/article.dart';

class ArticlePage extends StatefulWidget {
  final Article article;

  const ArticlePage(this.article, {Key? key}) : super(key: key);

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<ArticlePage> {
  final ImagePicker imagePicker = ImagePicker();
  File? imageFile;
  _ArticleState();

  @override
  Widget build(BuildContext context) {
    var article = widget.article;
    var dateTime = article.createdAt;
    var titleString = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    imageFile = article.imageFile;

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
                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 0),
                  child: SizedBox(
                    width: 300,
                    child: imageFile == null
                        ? const Text('画像が選択されていません。')
                        : Image.file(imageFile!),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          _setImageFromCamera(article);
                        },
                        style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder()),
                        child: const Icon(Icons.add_a_photo)),
                    OutlinedButton(
                        onPressed: () {
                          _setImageFromGallery(article);
                        },
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

  void _setImageFromCamera(Article article) async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        imageFile = null;
      }
      article.imageFile = imageFile;
      article.save();
    });
  }

  void _setImageFromGallery(Article article) async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        imageFile = null;
      }
      article.imageFile = imageFile;
      article.save();
    });
  }
}
