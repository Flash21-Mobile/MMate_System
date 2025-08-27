// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:design_system/animate/listener.dart';
import 'package:design_system/calendar/table/table_calendar_builders.dart';
import 'package:design_system/calendar/table/table_calendar_selected_cell.dart';
import 'package:design_system/calendar/table/table_calendar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CellContent extends StatelessWidget {
  final DateTime day;
  final DateTime focusedDay;
  final dynamic locale;
  final bool isTodayHighlighted;
  final bool isToday;
  final bool isSelected;
  final bool isOutside;
  final bool isDisabled;
  final bool isWeekend;
  final CalendarStyle calendarStyle;
  final CalendarBuilders calendarBuilders;
  final Alignment cellAlignment;

  const CellContent({
    super.key,
    required this.day,
    required this.focusedDay,
    required this.calendarStyle,
    required this.calendarBuilders,
    required this.isTodayHighlighted,
    required this.isToday,
    required this.isSelected,
    required this.isOutside,
    required this.isDisabled,
    required this.isWeekend,
    required this.cellAlignment,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    final dowLabel = DateFormat.EEEE(locale).format(day);
    final dayLabel = DateFormat.yMMMMd(locale).format(day);
    final semanticsLabel = '$dowLabel, $dayLabel';

    Widget? cell =
        calendarBuilders.prioritizedBuilder?.call(context, day, focusedDay);

    if (cell != null) {
      return Semantics(
        label: semanticsLabel,
        excludeSemantics: true,
        child: cell,
      );
    }

    final text =
        calendarStyle.dayTextFormatter?.call(day, locale) ?? '${day.day}';
    final margin = calendarStyle.cellMargin;
    final padding = cellAlignment == Alignment.center
        ? EdgeInsets.zero
        : EdgeInsets.only(bottom: 10);

    if (isSelected) {
      cell = calendarBuilders.selectedBuilder?.call(context, day, focusedDay) ??
          TableCalendarSelectedCell(
            text,
            isToday,
            padding,
            cellAlignment,
          );
    } else if (isToday) {
      cell = calendarBuilders.todayBuilder?.call(context, day, focusedDay) ??
          Container(
              margin: margin,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withAlpha(100),
                  blurRadius: 10,
                )
              ]),
              padding: padding,
              alignment: cellAlignment,
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 15.0,
                ),
              ));
    } else if (isOutside) {
      cell = calendarBuilders.outsideBuilder?.call(context, day, focusedDay) ??
          Container(
            margin: margin,
            padding: padding,
            alignment: cellAlignment,
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontSize: 15.0,
              ),
            ),
          );
    } else {
      cell = calendarBuilders.defaultBuilder?.call(context, day, focusedDay) ??
          Container(
            margin: margin,
            padding: padding,
            decoration: isWeekend
                ? calendarStyle.weekendDecoration
                : calendarStyle.defaultDecoration,
            alignment: cellAlignment,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onTertiary,
                  fontWeight: FontWeight.w500),
            ),
          );
    }

    return Semantics(
      label: semanticsLabel,
      excludeSemantics: true,
      child: cell,
    );
  }
}
