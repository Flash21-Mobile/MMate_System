import 'package:intl/intl.dart';

extension ToTimeFormat on DateTime {
  String toTimeByColon() {
    return DateFormat('HH:mm').format(this);
  }

  String toTimeByAmPm() {
    return DateFormat('a h:mm', 'ko_KR').format(this);
  }

  String toTimeByKorean() {
    return DateFormat('a h시 mm분', 'ko_KR').format(this);
  }

  String toLocalTime() {
    return DateFormat("HH:mm:ss.SSS").format(this);
  }
}
