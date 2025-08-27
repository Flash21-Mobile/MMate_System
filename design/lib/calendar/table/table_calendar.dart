import 'dart:math';
import 'package:design_system/calendar/table/table_calendar_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:function_system/utilities/haptic/haptic.dart';
import 'package:intl/intl.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

import '../../animate/ink_well.dart';
import '../../config.dart';
import '../../text/text_interface.dart';
import 'table_calendar_base.dart';
import 'table_calendar_builders.dart';
import 'table_calendar_cell_content.dart';
import 'table_calendar_style.dart';
import 'table_calendar_utiles.dart';
import 'table_calendar_week_style.dart';

typedef OnDaySelected = void Function(DateTime selectedDay);

typedef OnRangeSelected =
void Function(DateTime? start, DateTime? end, DateTime focusedDay);

enum RangeSelectionMode { disabled, toggledOff, toggledOn, enforced }

class TableCalendar<T> extends HookWidget {
  final dynamic locale;
  final DateTime? currentDay;

  /// Specifies `TableCalendar`'s current format.
  final CalendarFormat calendarFormat;
  final Map<CalendarFormat, String> availableCalendarFormats;
  final bool daysOfWeekVisible;
  final bool pageAnimationEnabled;
  final double rowHeight;
  final double daysOfWeekHeight;
  final Duration formatAnimationDuration;
  final Curve formatAnimationCurve;
  final Duration pageAnimationDuration;
  final Curve pageAnimationCurve;
  final StartingDayOfWeek startingDayOfWeek;
  final HitTestBehavior dayHitTestBehavior;
  final AvailableGestures availableGestures;
  final SimpleSwipeConfig simpleSwipeConfig;
  final DaysOfWeekStyle daysOfWeekStyle;
  final CalendarStyle calendarStyle;
  final CalendarBuilders<T>? calendarBuilders;
  final RangeSelectionMode rangeSelectionMode;
  final List<TableCalendarEvent>? eventsList;
  final bool Function(DateTime day)? enabledDayPredicate;
  final OnDaySelected? onDaySelected;
  final void Function(int? page)? onPageChanged;
  final void Function(CalendarFormat format)? onFormatChanged;
  final void Function(DateTime focusedDay)? onTapHeaderYear;
  final void Function(DateTime focusedDay)? onTapHeaderMonth;

  final PageController? pageController;

  final bool canSelectDate;

  final DateTime selectedDay;

  final BoxDecoration? cellDecoration;

  final Alignment cellAlignment;

  final Widget Function(
      DateTime date,
      bool isOpenDatePicker,
      Function() onTapCalendarType,
      Function() onTapPrevious,
      Function() onTapNext,
      )?
  customHeader;

  TableCalendar({
    super.key,
    DateTime? currentDay,
    this.locale,
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
    this.pageController,
    this.daysOfWeekStyle = const DaysOfWeekStyle(),
    this.calendarStyle = const CalendarStyle(),
    this.calendarBuilders,
    this.rangeSelectionMode = RangeSelectionMode.toggledOff,
    this.eventsList,
    this.enabledDayPredicate,
    this.onDaySelected,
    this.onPageChanged,
    this.onFormatChanged,
    this.onTapHeaderYear,
    this.onTapHeaderMonth,
    this.customHeader,
    this.canSelectDate = true,
    DateTime? selectedDay,

    this.cellDecoration,
    this.cellAlignment = Alignment.topCenter,
  }) : assert(availableCalendarFormats.keys.contains(calendarFormat)),
        assert(availableCalendarFormats.length <= CalendarFormat.values.length),
        currentDay = currentDay ?? DateTime.now(),
        selectedDay = selectedDay ?? normalizeDate(DateTime.now());

  final weekendDays = [DateTime.saturday, DateTime.sunday];
  final firstDay = normalizeDate(AppConfig.startCalendarDate);
  final lastDay = normalizeDate(AppConfig.endCalendarDate);

  bool get _shouldBlockOutsideDays =>
      !calendarStyle.outsideDaysVisible &&
          calendarFormat == CalendarFormat.month;

  void _swipeCalendarFormat(SwipeDirection direction) {
    if (onFormatChanged != null) {
      final formats = availableCalendarFormats.keys.toList();

      final isSwipeUp = direction == SwipeDirection.up;
      int id = formats.indexOf(calendarFormat);

      if (isSwipeUp) {
        id = min(formats.length - 1, id + 1);
      } else {
        id = max(0, id - 1);
      }

      onFormatChanged!(formats[id]);
    }
  }

  final defaultWeekNumber = CalendarBuilders(
    dowBuilder: (context, day) {
      final text = ['일', '월', '화', '수', '목', '금', '토'][day.weekday % 7];
      return Center(
        child: IndexTextMin(
          text,
          color:
          day.weekday % 7 == 0
              ? Colors
              .red // 일요일 빨간색
              : day.weekday % 7 == 6
              ? Colors
              .blue // 토요일 파란색
              : Colors.black, // 평일 검정색
        ),
      );
    },
  );

  int getPageFromYearMonth(int targetYear, int targetMonth) {
    int startYear = AppConfig.startCalendarDate.year;
    int startMonth = AppConfig.startCalendarDate.month;

    int yearDiff = targetYear - startYear;
    int monthDiff = targetMonth - startMonth;

    return yearDiff * 12 + monthDiff;
  }

  (int, int)? getDateTimeFromPage(int? page) {
    if (page == null) return null;

    int year = AppConfig.startCalendarDate.year;
    int month = AppConfig.startCalendarDate.month;

    int targetMonth = month + page;
    int targetYear = year + (targetMonth - 1) ~/ 12;
    int displayMonth = (targetMonth - 1) % 12 + 1;
    return (targetYear, displayMonth);
  }

  @override
  Widget build(BuildContext context) {
    final isOpenDatePicker = useState(false);

    void onTapCalendarType() {
      Haptic.min();
      isOpenDatePicker.value = !isOpenDatePicker.value;
    }

    List<int> years = List.generate(2101 - 1900, (index) => 1900 + index);

    List<int> months = List.generate(12, (index) => index + 1);
    final calendarPageController = pageController ?? usePageController();

    final yearScrollController = useMemoized(
          () => FixedExtentScrollController(
        initialItem: years.indexOf(selectedDay.year),
      ),
      [selectedDay.year],
    );

    final monthScrollController = useMemoized(
          () => FixedExtentScrollController(
        initialItem: months.indexOf(selectedDay.month),
      ),
      [selectedDay.month],
    );

    void onLeftChevronTap() {
      calendarPageController.previousPage(
        duration: pageAnimationDuration,
        curve: pageAnimationCurve,
      );
    }

    void onRightChevronTap() {
      calendarPageController.nextPage(
        duration: pageAnimationDuration,
        curve: pageAnimationCurve,
      );
    }

    final hasBuilt = useRef(false);

    void _onDayTapped(DateTime day) {
      final isOutside = day.month != selectedDay.month;
      if (isOutside && _shouldBlockOutsideDays) {
        return;
      }

      calendarPageController.animateToPage(
        getPageFromYearMonth(day.year, day.month),
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      onDaySelected?.call(day);
    }

    useEffect(() {
      if (hasBuilt.value) {
        Future.microtask(() {
          onDaySelected?.call(selectedDay);

          monthScrollController.animateToItem(
            months.indexOf(selectedDay.month),
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          yearScrollController.animateToItem(
            years.indexOf(selectedDay.year),
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
      } else {
        hasBuilt.value = true;
      }

      return;
    }, [selectedDay]);

    final headerText = useState('');

    useEffect(() {
      int? previousPage;

      void listener() {
        final currentPage = calendarPageController.page?.round();
        if (currentPage != null && currentPage != previousPage) {
          previousPage = currentPage;
          onPageChanged?.call(currentPage);
        }

        headerText.value =
        '${getDateTimeFromPage(currentPage)?.$1 ?? selectedDay.year}년 ${getDateTimeFromPage(currentPage)?.$2 ?? selectedDay.month}월';
      }

      calendarPageController.addListener(listener);

      return () {
        calendarPageController.removeListener(listener);
      };
    }, [calendarPageController]);


    return Column(
      children: [
        SizedBox(height: AppConfig.paddingIndex),
        customHeader != null
            ? customHeader!(
                selectedDay,
                isOpenDatePicker.value,
                onTapCalendarType,
                onLeftChevronTap,
                onRightChevronTap,
              )
            : Row(children: [
                IgnorePointer(
                    ignoring: canSelectDate == false,
                    child: MMateInkWell(
                        onTap: onTapCalendarType,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: AppConfig.paddingIndex),
                            IndexTextMax(
                              headerText.value,
                              fontWeight: FontWeight.w700,
                              color: isOpenDatePicker.value
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                              height: 0.8,
                            ),
                            if (canSelectDate)
                              Icon(
                                isOpenDatePicker.value
                                    ? Icons.keyboard_arrow_down_rounded
                                    : Icons.keyboard_arrow_right_rounded,
                                color: Theme.of(context).colorScheme.primary,
                                size: 24,
                              ),
                          ],
                        ))),
                Spacer(),
                Opacity(
                    opacity: isOpenDatePicker.value ? 0 : 1,
                    child: Row(children: [
                      MMateInkWell(
                        onTap: onLeftChevronTap,
                        child: Icon(
                          Icons.keyboard_arrow_left_rounded,
                          color: Theme.of(context).colorScheme.primary,
                          size: 36,
                        ),
                      ),
                      SizedBox(
                        width: AppConfig.paddingIndex / 2,
                      ),
                      MMateInkWell(
                        onTap: onRightChevronTap,
                        child: Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: Theme.of(context).colorScheme.primary,
                          size: 36,
                        ),
                      ),
                    ])),
                SizedBox(
                  width: AppConfig.paddingIndex / 2,
                )
              ]),
        SizedBox(
          height: 15,
        ),
        Flexible(
            flex: 0,
            child: Stack(children: [
              TableCalendarBase(
                pageController: calendarPageController,
                focusedDay: selectedDay,
                calendarFormat: calendarFormat,
                availableGestures: availableGestures,
                firstDay: firstDay,
                lastDay: lastDay,
                startingDayOfWeek: startingDayOfWeek,
                dowDecoration: daysOfWeekStyle.decoration,
                rowDecoration: calendarStyle.rowDecoration,
                tableBorder: calendarStyle.tableBorder,
                tablePadding: calendarStyle.tablePadding,
                dowVisible: daysOfWeekVisible,
                dowHeight: daysOfWeekHeight,
                rowHeight: rowHeight,
                formatAnimationDuration: formatAnimationDuration,
                formatAnimationCurve: formatAnimationCurve,
                pageAnimationEnabled: pageAnimationEnabled,
                pageAnimationDuration: pageAnimationDuration,
                pageAnimationCurve: pageAnimationCurve,
                availableCalendarFormats: availableCalendarFormats,
                simpleSwipeConfig: simpleSwipeConfig,
                sixWeekMonthsEnforced: false,
                onVerticalSwipe: _swipeCalendarFormat,
                onPageChanged: (focusedDay) {
                  // selectedDay.value = focusedDay;
                  // onPageChanged?.call(focusedDay);
                },
                weekNumberBuilder: (BuildContext context, DateTime day) {
                  final weekNumber = _calculateWeekNumber(day);
                  final cell = (calendarBuilders ?? defaultWeekNumber)
                      .weekNumberBuilder
                      ?.call(context, weekNumber);

                  return cell ??
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Center(
                          child: Text(
                            weekNumber.toString(),
                            style: calendarStyle.weekNumberTextStyle,
                          ),
                        ),
                      );
                },
                dowBuilder: (BuildContext context, DateTime day) {
                  Widget? dowCell = (calendarBuilders ?? defaultWeekNumber)
                      .dowBuilder
                      ?.call(context, day);

                  if (dowCell == null) {
                    final weekdayString =
                        daysOfWeekStyle.dowTextFormatter?.call(day, locale) ??
                            DateFormat.E(locale).format(day);

                    final isWeekend = _isWeekend(day, weekendDays: weekendDays);

                    dowCell = Center(
                      child: ExcludeSemantics(
                        child: Text(
                          weekdayString,
                          style: isWeekend
                              ? daysOfWeekStyle.weekendStyle
                              : daysOfWeekStyle.weekdayStyle,
                        ),
                      ),
                    );
                  }

                  return dowCell;
                },
                dayBuilder: (context, day, focusedMonth) {
                  return GestureDetector(
                    behavior: dayHitTestBehavior,
                    onTap: () => _onDayTapped(day),
                    child: _buildCell(day, focusedMonth),
                  );
                },
              ),
              isOpenDatePicker.value
                  ? Positioned.fill(
                      child: Container(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          padding: AppConfig.padding,
                          child: LayoutBuilder(builder: (context, constraints) {
                            return NotificationListener<ScrollEndNotification>(
                                onNotification: (_) {
                                  final yearIndex =
                                      yearScrollController.selectedItem;
                                  final monthIndex =
                                      monthScrollController.selectedItem;
                                  final date = DateTime(
                                    years[yearIndex],
                                    months[monthIndex],
                                    selectedDay.day,
                                  );
                                  _onDayTapped(date);
                                  return true;
                                },
                                child: Row(children: [
                                  SizedBox(
                                      height: constraints.maxHeight / 3 * 2,
                                      width: constraints.maxWidth / 2,
                                      child: CupertinoPicker(
                                          offAxisFraction: -0.43,
                                          itemExtent: 30.0,
                                          selectionOverlay: Container(
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .tertiary
                                                      .withAlpha(100),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                  ))),
                                          scrollController:
                                              yearScrollController,
                                          onSelectedItemChanged: (index) =>
                                              Haptic.min(),
                                          children: years.map((e) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                right:
                                                    AppConfig.paddingIndex / 2,
                                              ),
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: IndexTextThumb('$e년'),
                                              ),
                                            );
                                          }).toList())),
                                  SizedBox(
                                      height: constraints.maxHeight / 3 * 2,
                                      width: constraints.maxWidth / 2,
                                      child: CupertinoPicker(
                                          offAxisFraction: 0.43,
                                          itemExtent: 30.0,
                                          selectionOverlay: Container(
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .tertiary
                                                      .withAlpha(100),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5),
                                                  ))),
                                          scrollController:
                                              monthScrollController,
                                          onSelectedItemChanged: (index) =>
                                              Haptic.min(),
                                          children: months.map((e) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  left: AppConfig.paddingIndex /
                                                      2),
                                              // 텍스트를 오른쪽으로 좀 더 붙이기
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: IndexTextThumb('$e월'),
                                              ),
                                            );
                                          }).toList()))
                                ]));
                          })))
                  : SizedBox()
            ]))
      ],
    );
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

        final isToday = isSameDay(day, currentDay);
        final isDisabled = _isDayDisabled(day);
        final isWeekend = _isWeekend(day, weekendDays: weekendDays);

        final content = CellContent(
          key: ValueKey('CellContent-${day.year}-${day.month}-${day.day}'),
          day: day,
          focusedDay: focusedDay,
          cellAlignment:cellAlignment,
          calendarStyle: calendarStyle,
          calendarBuilders: calendarBuilders ?? defaultWeekNumber,
          isTodayHighlighted: calendarStyle.isTodayHighlighted,
          isToday: isToday,
          isSelected: isSameDay(day, selectedDay),
          isOutside: isOutside,
          isDisabled: isDisabled,
          isWeekend: isWeekend,
          locale: locale,
        );

        children.add(content);

        if (!isDisabled) {
          final events = eventsList
                  ?.where((value) => dateComparator(value.time, day))
                  .toList() ??
              [];

          Widget? markerWidget = (calendarBuilders ?? defaultWeekNumber)
              .markerBuilder
              ?.call(context, day);

          if (events.isNotEmpty && markerWidget == null) {
            final markerSize = calendarStyle.markerSize ??
                (shorterSide - calendarStyle.cellMargin.vertical) *
                    calendarStyle.markerSizeScale;

            markerWidget = events.isNotEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: events.length < 2
                                  ? [
                                      _buildSingleMarker(context,
                                          day: day, markerSize: markerSize)
                                    ]
                                  : [
                                      _buildSingleMarker(context,
                                          day: day, markerSize: markerSize),
                                      SizedBox(width: 3),
                                      IndexTextMin('+${events.length - 1}')
                                    ]),
                          SizedBox(height: 8)
                        ],
                      )
                : SizedBox();
          }

          if (markerWidget != null) {
            children.add(markerWidget);
          }
        }

        return Stack(
          alignment: calendarStyle.markersAlignment,
          clipBehavior:
              calendarStyle.canMarkersOverflow ? Clip.none : Clip.hardEdge,
          children: children,
        );
      },
    );
  }

  Widget _buildSingleMarker(BuildContext context,
      {required DateTime day, required double markerSize}) {
    return (calendarBuilders ?? defaultWeekNumber)
            .singleMarkerBuilder
            ?.call(context, day) ??
        Container(
          width: markerSize,
          height: markerSize,
          margin: calendarStyle.markerMargin,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Theme.of(context).colorScheme.primary),
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
    return day.isBefore(firstDay) ||
        day.isAfter(lastDay) ||
        !_isDayAvailable(day);
  }

  bool _isDayAvailable(DateTime day) {
    if (enabledDayPredicate == null) {
      return true;
    }

    return enabledDayPredicate!(day);
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
