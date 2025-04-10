import 'dart:ui';

import 'package:flutter/material.dart';

class TableCalendarEvent {
  final String? label;
  final String? labelIndex;
  final Color? color;
  final Color textColor;
  final DateTime time;

  TableCalendarEvent({
    this.label,
    this.color,
    Color? textColor,
    this.labelIndex,
    required this.time,
  }) : textColor = textColor ?? Colors.white;
}
