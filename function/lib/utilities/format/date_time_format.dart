import 'package:intl/intl.dart';

extension DateTimeFormatOnNuallable on DateTime? {
  String? toFeatureDate({bool showWeekDay = false}) {
    var result = [
      if (this?.year != null) this?.year,
      if (this?.month != null) this?.month.toString().padLeft(2, '0'),
      if (this?.day != null) this?.day.toString().padLeft(2, '0'),
    ].join('.');
    return '$result${showWeekDay && this != null ? ' ${DateFormat('EEEE', 'ko_KR').format(this!)}' : ''}';
  }

  String? toFeatureDate2() {
    var result = [
      if (this?.year != null) '${this?.year}년',
      if (this?.month != null) '${this?.month.toString().padLeft(2, '0')}월',
      if (this?.day != null) '${this?.day.toString().padLeft(2, '0')}일',
    ].join(' ');
    return result;
  }

  String? toFeatureDate3() {
    var result = [
      if (this?.month != null) '${this?.month.toString().padLeft(2, '0')}월',
      if (this?.day != null) '${this?.day.toString().padLeft(2, '0')}일',
    ].join(' ');
    return result;
  }

  String? toFeatureDate4() {
    if (this == null) return null;
    return DateFormat('yyMMdd').format(this!);
  }

  String toFeatureTime() {
    var result = [
      if (this?.hour != null) this?.hour,
      if (this?.minute != null) this?.minute
    ].join(':');
    return result;
  }

  String toFeatureTime2() {
    if (this == null) {
      return '';
    }
    return DateFormat('a h:mm', 'ko_KR').format(this!);
  }

  String toServerIso8601() {
    if (this == null) {
      return '';
    }
    return this!.toIso8601String().split('Z').first;
  }

  bool compare(DateTime date) {
    return this?.year == date.year &&
        this?.month == date.month &&
        this?.day == date.day;
  }
}

extension DateTimeFormat on DateTime {
  String toFeatureDate({bool showWeekDay = false}) {
    var result = [
      this.year,
      this.month.toString().padLeft(2, '0'),
      this.day.toString().padLeft(2, '0'),
    ].join('.');
    return '$result${showWeekDay ? ' ${DateFormat('EEEE', 'ko_KR').format(this)}' : ''}';
  }

  String toFeatureDate2() {
    var result = [
      '${this.year.toString().padLeft(2, '0')}년',
      '${this.month.toString().padLeft(2, '0')}월',
      '${this.day.toString().padLeft(2, '0')}일',
    ].join(' ');
    return result;
  }

  String toFeatureDate4() {
    return DateFormat('yyMMdd').format(this);
  }

  String toFeatureTime() {
    var result = [this.hour, this.minute].join(':');
    return result;
  }

  String toFeatureTime2() {
    return DateFormat('a h:mm', 'ko_KR').format(this);
  }

  String toServerIso8601() {
    return this.toIso8601String().split('Z').first;
  }

  String toServerString() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  bool compare(DateTime date) {
    return this.year == date.year &&
        this.month == date.month &&
        this.day == date.day;
  }
}
