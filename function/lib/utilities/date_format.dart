import 'package:intl/intl.dart';

class MMateDateFormat {
  static DateTime? formatStringToDateTime(String? dateTime) {
    try {
      return DateTime.tryParse(dateTime ?? '');
    } catch (e) {
      return null;
    }
  }
}
