import 'package:intl/intl.dart';

class MMateDateFormat {
  static DateTime? formatFeatureDateToDateTime(String dateString) {
    try {
      List<String> parts = dateString.split('.');
      if (parts.length != 3) return null; // 형식이 맞지 않으면 null 반환

      int year = int.parse(parts[0]);
      int month = int.parse(parts[1]);
      int day = int.parse(parts[2]);

      return DateTime(year, month, day);
    } catch (e) {
      return null;
    }
  }

  static DateTime? formatStringToDateTime(String? dateTime) {
    try {
      return DateTime.parse(dateTime ?? '');
    } catch (e) {
      return null;
    }
  }

  static DateTime? formatFeatureDateType4ToDateTime(String? input) {
    if (input == null || input.length != 6) return null;
    try {
      return DateTime.parse('20${input}');
    } catch (e) {
      return null;
    }
  }
}
