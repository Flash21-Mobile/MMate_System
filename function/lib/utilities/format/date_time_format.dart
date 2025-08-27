import 'package:intl/intl.dart';

extension ToDateFormat on DateTime {
  String toCompact() {

    return '${this.day} ${DateFormat('EEEE', 'ko_KR').format(this)}';
  }

  String toDateByDot({bool showWeekDay = false}) {
    var result = [
      year,
      month.toString().padLeft(2, '0'),
      day.toString().padLeft(2, '0'),
    ].join('-');
    return '$result${showWeekDay ? ' ${DateFormat('EEEE', 'ko_KR').format(this)}' : ''}';
  }

  String toDateByKorean({
    bool showYear = false,
    bool showWeekDay = false,
  }) {
    final pattern = [
      if (showYear) 'yyyy년',
      'MM월 dd일',
    ].join(' ');

    final base = DateFormat(pattern, 'ko_KR').format(this);

    if (showWeekDay) {
      final weekDay = DateFormat('EEE', 'ko_KR').format(this); // 월, 화, 수 등
      return '$base ($weekDay)';
    }

    return base;
  }

  String toDateByBirth() {
    return DateFormat('yyMMdd').format(this);
  }

  String toDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  bool compareDay(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }
}
