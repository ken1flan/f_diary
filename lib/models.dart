import 'package:objectbox/objectbox.dart';

@Entity()
class Article {
  int id = 0;
  String? title;
  String? body;
  DateTime? createdAt;
  DateTime? updatedAt;

  Article({this.title, this.body, this.createdAt, this.updatedAt});
}
