import 'dart:ui';

class TableCalendarEvent {
  final String? label;
  final Color? color;
  final DateTime time;

  TableCalendarEvent({
    this.label,
    this.color,
    required this.time,
  });
}
