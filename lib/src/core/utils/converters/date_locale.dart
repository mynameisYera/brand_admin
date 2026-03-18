import 'package:intl/intl.dart';

class DateLocale {
  static String getDate(String date) {
    final DateTime parsedDate = DateTime.parse(date).toLocal();
    return DateFormat('dd.MM.yyyy HH:mm', 'ru_RU').format(parsedDate);
  }
}