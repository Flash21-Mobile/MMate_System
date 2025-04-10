// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:math';

import 'package:design_system/calendar/table/table_calendar_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

import '../../config.dart';
import '../../text/text_interface.dart';
import 'table_calendar_base.dart';
import 'table_calendar_builders.dart';
import 'table_calendar_cell_content.dart';
import 'table_calendar_header_style.dart';
import 'table_calendar_style.dart';
import 'table_calendar_utiles.dart';
import 'table_calendar_week_style.dart';

/// Signature for `onDaySelected` callback. Contains the selected day and focused day.
typedef OnDaySelected = void Function(
  DateTime selectedDay,
  DateTime focusedDay,
);

/// Signature for `onRangeSelected` callback.
/// Contains start and end of the selected range, as well as currently focused day.
typedef OnRangeSelected = void Function(
  DateTime? start,
  DateTime? end,
  DateTime focusedDay,
);

/// Modes that range selection can operate in.
enum RangeSelectionMode { disabled, toggledOff, toggledOn, enforced }

/// Highly customizable, feature-packed Flutter calendar with gestures, animations and multiple formats.
class TableCalendar<T> extends StatefulWidget {
  /// Locale to format `TableCalendar` dates with, for example: `'en_US'`.
  ///
  /// If nothing is provided, a default locale will be used.
  final dynamic locale;

  /// DateTime that determines which days are currently visible and focused.
  final DateTime focusedDay;

  /// The first active day of `TableCalendar`.
  /// Blocks swiping to days before it.
  ///
  /// Days before it will use `disabledStyle` and trigger `onDisabledDayTapped` callback.
  final DateTime firstDay;

  /// The last active day of `TableCalendar`.
  /// Blocks swiping to days after it.
  ///
  /// Days after it will use `disabledStyle` and trigger `onDisabledDayTapped` callback.
  final DateTime lastDay;

  /// DateTime that will be treated as today. Defaults to `DateTime.now()`.
  ///
  /// Overriding this property might be useful for testing.
  final DateTime? currentDay;

  /// List of days treated as weekend days.
  /// Use built-in `DateTime` weekday constants (e.g. `DateTime.monday`) instead of `int` literals (e.g. `1`).
  final List<int> weekendDays;

  /// Specifies `TableCalendar`'s current format.
  final CalendarFormat calendarFormat;

  /// `Map` of `CalendarFormat`s and `String` names associated with them.
  /// Those `CalendarFormat`s will be used by internal logic to manage displayed format.
  ///
  /// To ensure proper vertical swipe behavior, `CalendarFormat`s should be in descending order (i.e. from biggest to smallest).
  ///
  /// For example:
  /// ```dart
  /// availableCalendarFormats: const {
  ///   CalendarFormat.month: 'Month',
  ///   CalendarFormat.week: 'Week',
  /// }
  /// ```
  final Map<CalendarFormat, String> availableCalendarFormats;

  /// Determines the visibility of the row of days of the week.
  final bool daysOfWeekVisible;

  /// When set to true, tapping on an outside day in `CalendarFormat.month` format
  /// will jump to the calendar page of the tapped month.

  /// When set to true, updating the `focusedDay` will display a scrolling animation
  /// if the currently visible calendar page is changed.
  final bool pageAnimationEnabled;

  /// When set to true, `CalendarFormat.month` will always display six weeks,
  /// even if the content would fit in less.

  /// When set to true, `TableCalendar` will fill available height.

  /// Whether to display week numbers on calendar.

  /// Used for setting the height of `TableCalendar`'s rows.
  final double rowHeight;

  /// Used for setting the height of `TableCalendar`'s days of week row.
  final double daysOfWeekHeight;

  /// Specifies the duration of size animation that takes place whenever `calendarFormat` is changed.
  final Duration formatAnimationDuration;

  /// Specifies the curve of size animation that takes place whenever `calendarFormat` is changed.
  final Curve formatAnimationCurve;

  /// Specifies the duration of scrolling animation that takes place whenever the visible calendar page is changed.
  final Duration pageAnimationDuration;

  /// Specifies the curve of scrolling animation that takes place whenever the visible calendar page is changed.
  final Curve pageAnimationCurve;

  /// `TableCalendar` will start weeks with provided day.
  ///
  /// Use `StartingDayOfWeek.monday` for Monday - Sunday week format.
  /// Use `StartingDayOfWeek.sunday` for Sunday - Saturday week format.
  final StartingDayOfWeek startingDayOfWeek;

  /// `HitTestBehavior` for every day cell inside `TableCalendar`.
  final HitTestBehavior dayHitTestBehavior;

  /// Specifies swipe gestures available to `TableCalendar`.
  /// If `AvailableGestures.none` is used, the calendar will only be interactive via buttons.
  final AvailableGestures availableGestures;

  /// Configuration for vertical swipe detector.
  final SimpleSwipeConfig simpleSwipeConfig;

  /// Style for `TableCalendar`'s header.

  /// Style for days of week displayed between `TableCalendar`'s header and content.
  final DaysOfWeekStyle daysOfWeekStyle;

  /// Style for `TableCalendar`'s content.
  final CalendarStyle calendarStyle;

  /// Set of custom builders for `TableCalendar` to work with.
  /// Use those to fully tailor the UI.
  final CalendarBuilders<T>? calendarBuilders;

  /// Current mode of range selection.
  ///
  /// * `RangeSelectionMode.disabled` - range selection is always off.
  /// * `RangeSelectionMode.toggledOff` - range selection is currently off, can be toggled by longpressing a day cell.
  /// * `RangeSelectionMode.toggledOn` - range selection is currently on, can be toggled by longpressing a day cell.
  /// * `RangeSelectionMode.enforced` - range selection is always on.
  final RangeSelectionMode rangeSelectionMode;

  /// Function that assigns a list of events to a specified day.
  final List<TableCalendarEvent>? eventsList;

  /// Function deciding whether given day should be enabled or not.
  /// If `false` is returned, this day will be disabled.
  final bool Function(DateTime day)? enabledDayPredicate;

  /// Function deciding whether given day should be marked as selected.
  final bool Function(DateTime day)? selectedDayPredicate;

  /// Function deciding whether given day is treated as a holiday.
  final bool Function(DateTime day)? holidayPredicate;

  /// Called whenever any day gets tapped.
  final OnDaySelected? onDaySelected;

  /// Called whenever any disabled day gets tapped.
  final void Function(DateTime day)? onDisabledDayTapped;

  /// Called whenever header gets long pressed.
  final void Function(DateTime focusedDay)? onHeaderLongPressed;

  /// Called whenever currently visible calendar page is changed.
  final void Function(DateTime focusedDay)? onPageChanged;

  /// Called whenever `calendarFormat` is changed.
  final void Function(CalendarFormat format)? onFormatChanged;

  /// Called when the calendar is created. Exposes its PageController.
  final void Function(PageController pageController)? onCalendarCreated;

  final void Function(DateTime focusedDay)? onTapHeaderYear;
  final void Function(DateTime focusedDay)? onTapHeaderMonth;

  final bool canDuplicate;

  final Alignment cellAlignment;

  final Widget Function(
    DateTime date,
    bool isOpenDatePicker,
    Function() onTapCalendarType,
    Function() onTapPrevious,
    Function() onTapNext,
  )? customHeader;

  /// Creates a `TableCalendar` widget.
  TableCalendar({
    super.key,
    required DateTime focusedDay,
    DateTime? currentDay,
    this.locale,
    this.weekendDays = const [DateTime.saturday, DateTime.sunday],
    this.calendarFormat = CalendarFormat.month,
    this.availableCalendarFormats = const {
      CalendarFormat.month: 'Month',
      CalendarFormat.twoWeeks: '2 weeks',
      CalendarFormat.week: 'Week',
    },
    this.daysOfWeekVisible = true,
    this.pageAnimationEnabled = true,
    this.rowHeight = 52.0,
    this.daysOfWeekHeight = 16.0,
    this.formatAnimationDuration = const Duration(milliseconds: 200),
    this.formatAnimationCurve = Curves.linear,
    this.pageAnimationDuration = const Duration(milliseconds: 300),
    this.pageAnimationCurve = Curves.easeOut,
    this.startingDayOfWeek = StartingDayOfWeek.sunday,
    this.dayHitTestBehavior = HitTestBehavior.opaque,
    this.availableGestures = AvailableGestures.all,
    this.simpleSwipeConfig = const SimpleSwipeConfig(
      verticalThreshold: 25.0,
      swipeDetectionBehavior: SwipeDetectionBehavior.continuousDistinct,
    ),
    this.daysOfWeekStyle = const DaysOfWeekStyle(),
    this.calendarStyle = const CalendarStyle(),
    this.calendarBuilders,
    this.rangeSelectionMode = RangeSelectionMode.toggledOff,
    this.eventsList,
    this.enabledDayPredicate,
    this.selectedDayPredicate,
    this.holidayPredicate,
    this.onDaySelected,
    this.onDisabledDayTapped,
    this.onHeaderLongPressed,
    this.onPageChanged,
    this.onFormatChanged,
    this.onCalendarCreated,
    this.onTapHeaderYear,
    this.onTapHeaderMonth,
    this.cellAlignment = Alignment.topCenter,
    this.canDuplicate = false,
    this.customHeader,
  })  : assert(availableCalendarFormats.keys.contains(calendarFormat)),
        assert(availableCalendarFormats.length <= CalendarFormat.values.length),
        assert(
          weekendDays.isNotEmpty &&
              weekendDays.every(
                (day) => day >= DateTime.monday && day <= DateTime.sunday,
              ),
        ),
        focusedDay = normalizeDate(focusedDay),
        firstDay = normalizeDate(AppConfig.startCalendarDate),
        lastDay = normalizeDate(AppConfig.endCalendarDate),
        currentDay = currentDay ?? DateTime.now();

  @override
  State<TableCalendar<T>> createState() => _TableCalendarState<T>();
}

class _TableCalendarState<T> extends State<TableCalendar<T>> {
  late final PageController _pageController;
  ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());

  final _isOpenDatePicker = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _focusedDay = ValueNotifier(widget.focusedDay);
  }

  @override
  void didUpdateWidget(TableCalendar<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_focusedDay.value != widget.focusedDay) {
      _focusedDay.value = widget.focusedDay;
    }
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    super.dispose();
  }

  bool get _shouldBlockOutsideDays =>
      !widget.calendarStyle.outsideDaysVisible &&
      widget.calendarFormat == CalendarFormat.month;

  void _swipeCalendarFormat(SwipeDirection direction) {
    if (widget.onFormatChanged != null) {
      final formats = widget.availableCalendarFormats.keys.toList();

      final isSwipeUp = direction == SwipeDirection.up;
      int id = formats.indexOf(widget.calendarFormat);

      // Order of CalendarFormats must be from biggest to smallest,
      // e.g.: [month, twoWeeks, week]
      if (isSwipeUp) {
        id = min(formats.length - 1, id + 1);
      } else {
        id = max(0, id - 1);
      }

      widget.onFormatChanged!(formats[id]);
    }
  }

  void _onDayTapped(DateTime day) {
    final isOutside = day.month != _focusedDay.value.month;
    if (isOutside && _shouldBlockOutsideDays) {
      return;
    }

    if (_isDayDisabled(day)) {
      return widget.onDisabledDayTapped?.call(day);
    }

    _updateFocusOnTap(day);

    widget.onDaySelected?.call(day, _focusedDay.value);
  }

  void _updateFocusOnTap(DateTime day) {
    if (widget.calendarFormat == CalendarFormat.month) {
      if (_isBeforeMonth(day, _focusedDay.value)) {
        _focusedDay.value = _firstDayOfMonth(_focusedDay.value);
      } else if (_isAfterMonth(day, _focusedDay.value)) {
        _focusedDay.value = _lastDayOfMonth(_focusedDay.value);
      } else {
        _focusedDay.value = day;
      }
    } else {
      _focusedDay.value = day;
    }
  }

  void _onLeftChevronTap() {
    _pageController.previousPage(
      duration: widget.pageAnimationDuration,
      curve: widget.pageAnimationCurve,
    );
  }

  void _onRightChevronTap() {
    _pageController.nextPage(
      duration: widget.pageAnimationDuration,
      curve: widget.pageAnimationCurve,
    );
  }

  void _onTapCalendarType() {
    _isOpenDatePicker.value = !_isOpenDatePicker.value;
  }

  final defaultWeekNumber = CalendarBuilders(
    dowBuilder: (context, day) {
      final text = ['일', '월', '화', '수', '목', '금', '토'][day.weekday % 7];
      return Center(
        child: IndexTextMin(
          text,
          color: day.weekday % 7 == 0
              ? Colors.red // 일요일 빨간색
              : day.weekday % 7 == 6
                  ? Colors.blue // 토요일 파란색
                  : Colors.black, // 평일 검정색
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _isOpenDatePicker,
        builder: (_, value, __) {
          return Column(
            children: [
              SizedBox(height: AppConfig.paddingIndex),
              widget.customHeader != null
                  ? widget.customHeader!(
                      _focusedDay.value,
                      _isOpenDatePicker.value,
                      _onTapCalendarType,
                      _onLeftChevronTap,
                      _onRightChevronTap,
                    )
                  : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Material(
                          color: Colors.transparent,
                          child: InkWell(
                              borderRadius: BorderRadius.circular(100),
                              child: Icon(Icons.arrow_back_ios_new_rounded,
                                  size: 20),
                              onTap: () => _onLeftChevronTap())),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        onTap: () {
                                          (widget.onTapHeaderYear ??
                                              () {})(_focusedDay.value);
                                        },
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: IndexTextMax(
                                          '${_focusedDay.value.year}',
                                          fontWeight: FontWeight.bold,
                                        ))),
                                IndexTextMax('.', fontWeight: FontWeight.bold),
                                SizedBox(width: 5),
                                Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        onTap: () {
                                          (widget.onTapHeaderMonth ??
                                              () {})(_focusedDay.value);
                                        },
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: IndexTextMax(
                                              '${_focusedDay.value.month}',
                                              fontWeight: FontWeight.bold,
                                            )))),
                                IndexTextMax('.', fontWeight: FontWeight.bold),
                                SizedBox(width: 5),
                                Container(
                                    alignment: Alignment.center,
                                    child: IndexTextMax(
                                      '${_focusedDay.value.day}',
                                      fontWeight: FontWeight.bold,
                                    )),
                              ])),
                      Material(
                          color: Colors.transparent,
                          child: InkWell(
                              borderRadius: BorderRadius.circular(100),
                              child: Icon(Icons.arrow_forward_ios_rounded,
                                  size: 20),
                              onTap: () => _onRightChevronTap())),
                    ]),
              SizedBox(
                height: 15,
              ),
              Flexible(
                  flex: 0,
                  child: Stack(children: [
                    TableCalendarBase(
                      onCalendarCreated: (pageController) {
                        _pageController = pageController;
                        widget.onCalendarCreated?.call(pageController);
                      },
                      focusedDay: _focusedDay.value,
                      calendarFormat: widget.calendarFormat,
                      availableGestures: widget.availableGestures,
                      firstDay: widget.firstDay,
                      lastDay: widget.lastDay,
                      startingDayOfWeek: widget.startingDayOfWeek,
                      dowDecoration: widget.daysOfWeekStyle.decoration,
                      rowDecoration: widget.calendarStyle.rowDecoration,
                      tableBorder: widget.calendarStyle.tableBorder,
                      tablePadding: widget.calendarStyle.tablePadding,
                      dowVisible: widget.daysOfWeekVisible,
                      dowHeight: widget.daysOfWeekHeight,
                      rowHeight: widget.rowHeight,
                      formatAnimationDuration: widget.formatAnimationDuration,
                      formatAnimationCurve: widget.formatAnimationCurve,
                      pageAnimationEnabled: widget.pageAnimationEnabled,
                      pageAnimationDuration: widget.pageAnimationDuration,
                      pageAnimationCurve: widget.pageAnimationCurve,
                      availableCalendarFormats: widget.availableCalendarFormats,
                      simpleSwipeConfig: widget.simpleSwipeConfig,
                      sixWeekMonthsEnforced: false,
                      onVerticalSwipe: _swipeCalendarFormat,
                      onPageChanged: (focusedDay) {
                        _focusedDay.value = focusedDay;
                        widget.onPageChanged?.call(focusedDay);
                      },
                      weekNumbersVisible: false,
                      weekNumberBuilder: (BuildContext context, DateTime day) {
                        final weekNumber = _calculateWeekNumber(day);
                        final cell =
                            (widget.calendarBuilders ?? defaultWeekNumber)
                                .weekNumberBuilder
                                ?.call(context, weekNumber);

                        return cell ??
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Center(
                                child: Text(
                                  weekNumber.toString(),
                                  style:
                                      widget.calendarStyle.weekNumberTextStyle,
                                ),
                              ),
                            );
                      },
                      dowBuilder: (BuildContext context, DateTime day) {
                        Widget? dowCell =
                            (widget.calendarBuilders ?? defaultWeekNumber)
                                .dowBuilder
                                ?.call(context, day);

                        if (dowCell == null) {
                          final weekdayString = widget
                                  .daysOfWeekStyle.dowTextFormatter
                                  ?.call(day, widget.locale) ??
                              DateFormat.E(widget.locale).format(day);

                          final isWeekend =
                              _isWeekend(day, weekendDays: widget.weekendDays);

                          dowCell = Center(
                            child: ExcludeSemantics(
                              child: Text(
                                weekdayString,
                                style: isWeekend
                                    ? widget.daysOfWeekStyle.weekendStyle
                                    : widget.daysOfWeekStyle.weekdayStyle,
                              ),
                            ),
                          );
                        }

                        return dowCell;
                      },
                      dayBuilder: (context, day, focusedMonth) {
                        return GestureDetector(
                          behavior: widget.dayHitTestBehavior,
                          onTap: () => _onDayTapped(day),
                          child: _buildCell(day, focusedMonth),
                        );
                      },
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: _isOpenDatePicker,
                      builder: (_, value, __) {
                        return value
                            ? Positioned.fill(
                                child: Container(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    padding: AppConfig.padding,
                                    child: LayoutBuilder(
                                        builder: (context, constraints) {
                                      List<int> years = List.generate(
                                          2101 - 1900, (index) => 1900 + index);

                                      List<int> months = List.generate(
                                          12, (index) => index + 1);

                                      final yearScrollController =
                                          FixedExtentScrollController(
                                              initialItem: years.indexOf(
                                                  _focusedDay.value.year));

                                      final monthScrollController =
                                          FixedExtentScrollController(
                                              initialItem: months.indexOf(
                                                  _focusedDay.value.month));

                                      return NotificationListener<
                                              ScrollEndNotification>(
                                          onNotification: (notification) {
                                            final yearIndex =
                                                yearScrollController
                                                    .selectedItem;
                                            final monthIndex =
                                                monthScrollController
                                                    .selectedItem;
                                            final date = DateTime(
                                              years[yearIndex],
                                              months[monthIndex],
                                              _focusedDay.value.day,
                                            );
                                            _onDayTapped(date);
                                            return true;
                                          },
                                          child: Row(children: [
                                            SizedBox(
                                                height: constraints.maxHeight /
                                                    3 *
                                                    2,
                                                width: constraints.maxWidth / 2,
                                                child: CupertinoPicker(
                                                    offAxisFraction: -0.43,
                                                    itemExtent: 30.0,
                                                    selectionOverlay: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .tertiary
                                                                    .withAlpha(
                                                                        100),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          5),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          5),
                                                                ))),
                                                    scrollController:
                                                        yearScrollController,
                                                    onSelectedItemChanged:
                                                        (index) {},
                                                    children: years.map((e) {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          right: AppConfig
                                                                  .paddingIndex /
                                                              2,
                                                        ),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: IndexTextThumb(
                                                              '$e년'),
                                                        ),
                                                      );
                                                    }).toList())),
                                            SizedBox(
                                                height: constraints.maxHeight /
                                                    3 *
                                                    2,
                                                width: constraints.maxWidth / 2,
                                                child: CupertinoPicker(
                                                    offAxisFraction: 0.43,
                                                    itemExtent: 30.0,
                                                    selectionOverlay: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .tertiary
                                                                    .withAlpha(
                                                                        100),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          5),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          5),
                                                                ))),
                                                    scrollController:
                                                        monthScrollController,
                                                    onSelectedItemChanged:
                                                        (index) {},
                                                    children: months.map((e) {
                                                      return Padding(
                                                        padding: EdgeInsets.only(
                                                            left: AppConfig
                                                                    .paddingIndex /
                                                                2),
                                                        // 텍스트를 오른쪽으로 좀 더 붙이기
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: IndexTextThumb(
                                                              '$e월'),
                                                        ),
                                                      );
                                                    }).toList()))
                                          ]));
                                    })))
                            : SizedBox();
                      },
                    )
                  ]))
            ],
          );
        });
  }

  Widget _buildCell(DateTime day, DateTime focusedDay) {
    final isOutside = day.month != focusedDay.month;

    if (isOutside && _shouldBlockOutsideDays) {
      return Container();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final shorterSide = constraints.maxHeight > constraints.maxWidth
            ? constraints.maxWidth
            : constraints.maxHeight;

        final children = <Widget>[];

        final isToday = isSameDay(day, widget.currentDay);
        final isDisabled = _isDayDisabled(day);
        final isWeekend = _isWeekend(day, weekendDays: widget.weekendDays);

        final content = CellContent(
          key: ValueKey('CellContent-${day.year}-${day.month}-${day.day}'),
          day: day,
          focusedDay: focusedDay,
          cellAlignment: widget.cellAlignment,
          calendarStyle: widget.calendarStyle,
          calendarBuilders: widget.calendarBuilders ?? defaultWeekNumber,
          isTodayHighlighted: widget.calendarStyle.isTodayHighlighted,
          isToday: isToday,
          isSelected: widget.selectedDayPredicate?.call(day) ?? false,
          isOutside: isOutside,
          isDisabled: isDisabled,
          isWeekend: isWeekend,
          isHoliday: widget.holidayPredicate?.call(day) ?? false,
          locale: widget.locale,
        );

        children.add(content);

        if (!isDisabled) {
          final events = widget.eventsList
                  ?.where((value) => dateComparator(value.time, day))
                  .toList() ??
              [];

          Widget? markerWidget = (widget.calendarBuilders ?? defaultWeekNumber)
              .markerBuilder
              ?.call(context, day);

          if (events.isNotEmpty && markerWidget == null) {
            final markerSize = widget.calendarStyle.markerSize ??
                (shorterSide - widget.calendarStyle.cellMargin.vertical) *
                    widget.calendarStyle.markerSizeScale;

            markerWidget = Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: events.isNotEmpty
                    ? widget.canDuplicate
                        ? events.length < 2
                            ? [_buildSingleMarker(day, markerSize)]
                            : [
                                _buildSingleMarker(day, markerSize),
                                SizedBox(width: 3),
                                IndexTextMin('+${events.length - 1}')
                              ]
                        : [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IndexTextMicro(
                                    events.first.labelIndex,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    height: 1.1,
                                  ),
                                  Container(
                                      // height: 10,
                                      width: constraints.maxHeight / 5 * 3,
                                      margin: EdgeInsets.only(bottom: 3),
                                      decoration: BoxDecoration(
                                        color: events.first.color,
                                        borderRadius: AppConfig.borderRadius,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IndexTextMicro(
                                            height: 1.3,
                                            events.first.label,
                                            color: events.first.textColor,
                                          ),
                                        ],
                                      ))
                                ])
                          ]
                    : []);
          }

          if (markerWidget != null) {
            children.add(markerWidget);
          }
        }

        return Stack(
          alignment: widget.calendarStyle.markersAlignment,
          clipBehavior: widget.calendarStyle.canMarkersOverflow
              ? Clip.none
              : Clip.hardEdge,
          children: children,
        );
      },
    );
  }

  Widget _buildSingleMarker(DateTime day, double markerSize) {
    return (widget.calendarBuilders ?? defaultWeekNumber)
            .singleMarkerBuilder
            ?.call(context, day) ??
        Container(
          width: markerSize,
          height: markerSize,
          margin: widget.calendarStyle.markerMargin,
          decoration: widget.calendarStyle.markerDecoration,
        );
  }

  int _calculateWeekNumber(DateTime date) {
    final middleDay = date.add(const Duration(days: 3));
    final dayOfYear = _dayOfYear(middleDay);

    return 1 + ((dayOfYear - 1) / 7).floor();
  }

  int _dayOfYear(DateTime date) {
    return normalizeDate(date).difference(DateTime.utc(date.year)).inDays + 1;
  }

  bool _isDayDisabled(DateTime day) {
    return day.isBefore(widget.firstDay) ||
        day.isAfter(widget.lastDay) ||
        !_isDayAvailable(day);
  }

  bool _isDayAvailable(DateTime day) {
    if (widget.enabledDayPredicate == null) {
      return true;
    }

    return widget.enabledDayPredicate!(day);
  }

  DateTime _firstDayOfMonth(DateTime month) {
    return DateTime.utc(month.year, month.month);
  }

  DateTime _lastDayOfMonth(DateTime month) {
    final date = month.month < 12
        ? DateTime.utc(month.year, month.month + 1)
        : DateTime.utc(month.year + 1);
    return date.subtract(const Duration(days: 1));
  }

  bool _isBeforeMonth(DateTime day, DateTime month) {
    if (day.year == month.year) {
      return day.month < month.month;
    } else {
      return day.isBefore(month);
    }
  }

  bool _isAfterMonth(DateTime day, DateTime month) {
    if (day.year == month.year) {
      return day.month > month.month;
    } else {
      return day.isAfter(month);
    }
  }

  bool _isWeekend(
    DateTime day, {
    List<int> weekendDays = const [DateTime.saturday, DateTime.sunday],
  }) {
    return weekendDays.contains(day.weekday);
  }

  bool dateComparator(DateTime aDate, DateTime bDate) {
    return aDate.year == bDate.year &&
        aDate.month == bDate.month &&
        aDate.day == bDate.day;
  }
}
