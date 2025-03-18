class DateFormat {
  static String? formatDateTimeToFeatureDate(DateTime? dateTime) {
    if(dateTime ==null){
      return null;
    }
    var result = [
      if (dateTime?.year != null) dateTime?.year,
      if (dateTime?.month != null) dateTime?.month.toString().padLeft(2, '0'),
      if (dateTime?.day != null) dateTime?.day.toString().padLeft(2, '0'),
    ].join('.');
    return result;
  }

  static DateTime? formatFeatureDateToDateTime(String dateString) {
    try {
      List<String> parts = dateString.split('.');
      if (parts.length != 3) return null; // 형식이 맞지 않으면 null 반환

      int year = int.parse(parts[0]);
      int month = int.parse(parts[1]);
      int day = int.parse(parts[2]);

      return DateTime(year, month, day);
    } catch (e) {
      return null; // 변환 중 오류 발생 시 null 반환
    }
  }

  static String formatDateTimeToFeatureTime(DateTime? dateTime) {
    var result = "${dateTime?.hour}:${dateTime?.minute}";
    return result;
  }

  static DateTime? formatStringToDateTime(String? dateTime) {
    try {
      return DateTime.parse(dateTime ?? '');
    } catch (e) {
      return null;
    }
  }

  static String formatDateTimeToServer(DateTime dateTime) {
    return dateTime.toIso8601String().split('Z').first; // UTC 표시(Z) 제거
  }

  static bool dateComparator(DateTime aDate, DateTime bDate) {
    return aDate.year == bDate.year &&
        aDate.month == bDate.month &&
        aDate.day == bDate.day;
  }
}
