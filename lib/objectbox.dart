import 'objectbox.g.dart';

late ObjectBox objectbox;

class ObjectBox {
  late final Store store;

  ObjectBox._create(this.store) {
    // 追加の初期化があれば足す。
  }

  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }
}
