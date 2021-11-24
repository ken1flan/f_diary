import 'package:objectbox/objectbox.dart';

@Entity()
class Article {
  int id = 0;

  String? title;
  String? body;

  @Property(type: PropertyType.date)
  DateTime date;

  @Transient()
  int? notPersisted;

  Article({this.title, this.body, DateTime? date})
      : date = date ?? DateTime.now();

  @override
  toString() => 'Article{id: $id, title: $title}';
}
