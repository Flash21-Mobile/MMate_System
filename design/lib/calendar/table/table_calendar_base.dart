// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:design_system/calendar/table/table_calendar_core.dart';
import 'package:design_system/calendar/table/table_calendar_utiles.dart';
import 'package:design_system/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class TableCalendarBase extends HookWidget {
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime focusedDay;
  final CalendarFormat calendarFormat;
  final DayBuilder? dowBuilder;
  final DayBuilder? weekNumberBuilder;
  final FocusedDayBuilder dayBuilder;
  final double? dowHeight;
  final double rowHeight;
  final bool sixWeekMonthsEnforced;
  final bool dowVisible;
  final Decoration? dowDecoration;
  final Decoration? rowDecoration;
  final TableBorder? tableBorder;
  final EdgeInsets? tablePadding;
  final Duration formatAnimationDuration;
  final Curve formatAnimationCurve;
  final bool pageAnimationEnabled;
  final Duration pageAnimationDuration;
  final Curve pageAnimationCurve;
  final StartingDayOfWeek startingDayOfWeek;
  final AvailableGestures availableGestures;
  final SimpleSwipeConfig simpleSwipeConfig;
  final Map<CalendarFormat, String> availableCalendarFormats;
  final SwipeCallback? onVerticalSwipe;
  final void Function(DateTime focusedDay)? onPageChanged;
  final PageController pageController;

  TableCalendarBase({
    super.key,
    required this.firstDay,
    required this.lastDay,
    required this.focusedDay,
    this.calendarFormat = CalendarFormat.month,
    this.dowBuilder,
    required this.dayBuilder,
    this.dowHeight,
    required this.rowHeight,
    this.sixWeekMonthsEnforced = false,
    this.dowVisible = true,
    this.weekNumberBuilder,
    this.dowDecoration,
    this.rowDecoration,
    this.tableBorder,
    this.tablePadding,
    this.formatAnimationDuration = const Duration(milliseconds: 200),
    this.formatAnimationCurve = Curves.linear,
    this.pageAnimationEnabled = true,
    this.pageAnimationDuration = const Duration(milliseconds: 300),
    this.pageAnimationCurve = Curves.easeOut,
    this.startingDayOfWeek = StartingDayOfWeek.sunday,
    this.availableGestures = AvailableGestures.all,
    this.simpleSwipeConfig = const SimpleSwipeConfig(
      verticalThreshold: 25.0,
      swipeDetectionBehavior: SwipeDetectionBehavior.continuousDistinct,
    ),
    this.availableCalendarFormats = const {
      CalendarFormat.month: 'Month',
      CalendarFormat.twoWeeks: '2 weeks',
      CalendarFormat.week: 'Week',
    },
    this.onVerticalSwipe,
    this.onPageChanged,
    required this.pageController,
  }) : assert(!dowVisible || (dowHeight != null && dowBuilder != null)),
        assert(isSameDay(focusedDay, firstDay) || focusedDay.isAfter(firstDay)),
        assert(isSameDay(focusedDay, lastDay) || focusedDay.isBefore(lastDay));

  bool get _canScrollHorizontally =>
      availableGestures == AvailableGestures.all ||
          availableGestures == AvailableGestures.horizontalSwipe;

  bool get _canScrollVertically =>
      availableGestures == AvailableGestures.all ||
          availableGestures == AvailableGestures.verticalSwipe;

  @override
  Widget build(BuildContext context) {
    final _focusedDay = useState(focusedDay);
    final _pageHeight = useState(
      _getPageHeight(_getRowCount(calendarFormat, _focusedDay.value)),
    );

    final _previousIndex = useState(
      _calculateFocusedPage(calendarFormat, firstDay, _focusedDay.value),
    );
    final _pageCallbackDisabled = useState(false);

    useEffect(() {
      final initialPage = _calculateFocusedPage(
        calendarFormat,
        firstDay,
        _focusedDay.value,
      );

      Future.microtask(() {
        pageController.jumpToPage(initialPage);
      });

      return null;
    }, []);

    return  LayoutBuilder(
      builder: (context, constraints) {
        return SimpleGestureDetector(
          onVerticalSwipe: _canScrollVertically ? onVerticalSwipe : null,
          swipeConfig: simpleSwipeConfig,
          child: ValueListenableBuilder<double>(
              valueListenable: _pageHeight,
              builder: (context, value, child) {
                final height =
                constraints.hasBoundedHeight ? constraints.maxHeight : value;

                return AnimatedSize(
                  duration: formatAnimationDuration,
                  curve: formatAnimationCurve,
                  alignment: Alignment.topCenter,
                  child: SizedBox(height: height, child: child),
                );
              },
              child:  CalendarCore(
                constraints: constraints,
                pageController: pageController,
                scrollPhysics:
                _canScrollHorizontally
                    ? const PageScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                firstDay: firstDay,
                lastDay: lastDay,
                startingDayOfWeek: startingDayOfWeek,
                calendarFormat: calendarFormat,
                previousIndex: _previousIndex.value,
                focusedDay: _focusedDay.value,
                sixWeekMonthsEnforced: sixWeekMonthsEnforced,
                dowVisible: dowVisible,
                dowHeight: dowHeight,
                rowHeight: rowHeight,
                weekNumberBuilder: weekNumberBuilder,
                dowDecoration: dowDecoration,
                rowDecoration: rowDecoration,
                tableBorder: tableBorder,
                tablePadding: tablePadding,
                onPageChanged: (index, focusedMonth) {
                  if (!_pageCallbackDisabled.value) {
                    if (!isSameDay(_focusedDay.value, focusedMonth)) {
                      _focusedDay.value = focusedMonth;
                    }

                    if (calendarFormat == CalendarFormat.month &&
                        !sixWeekMonthsEnforced &&
                        !constraints.hasBoundedHeight) {
                      final rowCount = _getRowCount(calendarFormat, focusedMonth);
                      _pageHeight.value = _getPageHeight(rowCount);
                    }

                    _previousIndex.value = index;
                    onPageChanged?.call(focusedMonth);
                  }

                  _pageCallbackDisabled.value = false;
                },
                dowBuilder: dowBuilder,
                dayBuilder: dayBuilder,
              )
          ),
        );
      },
    );
  }

  double _getPageHeight(int rowCount) {
    final tablePaddingHeight = tablePadding?.vertical ?? 0.0;
    return dowHeight! + rowCount * rowHeight + tablePaddingHeight;
  }

  int _calculateFocusedPage(
      CalendarFormat format,
      DateTime startDay,
      DateTime focusedDay,
      ) {
    switch (format) {
      case CalendarFormat.month:
        return _getMonthCount(startDay, focusedDay);
      case CalendarFormat.twoWeeks:
        return _getTwoWeekCount(startDay, focusedDay);
      case CalendarFormat.week:
        return _getWeekCount(startDay, focusedDay);
    }
  }

  int _getMonthCount(DateTime first, DateTime last) {
    final yearDif = last.year - first.year;
    final monthDif = last.month - first.month;

    return yearDif * 12 + monthDif;
  }

  int _getWeekCount(DateTime first, DateTime last) {
    return last.difference(_firstDayOfWeek(first)).inDays ~/ 7;
  }

  int _getTwoWeekCount(DateTime first, DateTime last) {
    return last.difference(_firstDayOfWeek(first)).inDays ~/ 14;
  }

  int _getRowCount(CalendarFormat format, DateTime focusedDay) {
    if (format == CalendarFormat.twoWeeks) {
      return 2;
    } else if (format == CalendarFormat.week) {
      return 1;
    } else if (sixWeekMonthsEnforced) {
      return 6;
    }

    final first = _firstDayOfMonth(focusedDay);
    final daysBefore = _getDaysBefore(first);
    final firstToDisplay = first.subtract(Duration(days: daysBefore));

    final last = _lastDayOfMonth(focusedDay);
    final daysAfter = _getDaysAfter(last);
    final lastToDisplay = last.add(Duration(days: daysAfter));

    return (lastToDisplay.difference(firstToDisplay).inDays + 1) ~/ 7;
  }

  int _getDaysBefore(DateTime firstDay) {
    return (firstDay.weekday + 7 - getWeekdayNumber(startingDayOfWeek)) % 7;
  }

  int _getDaysAfter(DateTime lastDay) {
    final invertedStartingWeekday = 8 - getWeekdayNumber(startingDayOfWeek);

    final daysAfter = 7 - ((lastDay.weekday + invertedStartingWeekday) % 7);
    if (daysAfter == 7) {
      return 0;
    }

    return daysAfter;
  }

  DateTime _firstDayOfWeek(DateTime week) {
    final daysBefore = _getDaysBefore(week);
    return week.subtract(Duration(days: daysBefore));
  }

  DateTime _firstDayOfMonth(DateTime month) {
    return DateTime.utc(month.year, month.month);
  }

  DateTime _lastDayOfMonth(DateTime month) {
    final date =
    month.month < 12
        ? DateTime.utc(month.year, month.month + 1)
        : DateTime.utc(month.year + 1);
    return date.subtract(const Duration(days: 1));
  }
}
