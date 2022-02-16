import 'package:intl/date_symbol_data_local.dart';

class IntlSupport {
  static Future<void> initilize() async {
    await initializeDateFormatting('ja_JP');
  }
}
