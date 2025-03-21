import 'package:design_system/calendar/post/post_calendar_focused.dart';
import 'package:design_system/calendar/table/table_calendar.dart';
import 'package:design_system/calendar/table/table_calendar_utiles.dart';
import 'package:design_system/calendar/timepicker/time_picker.dart';
import 'package:flutter/material.dart';

class PostCalendar extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime dateTime)? onChanged;
  final PostCalendarFocused state;
  final bool viewTopOpenDivider;
  final bool viewTopCloseDivider;
  final bool viewBottomOpenDivider;
  final bool viewBottomCloseDivider;

  const PostCalendar({
    super.key,
    required this.selectedDate,
    required this.state,
    this.onChanged,
    this.viewTopOpenDivider = true,
    this.viewTopCloseDivider = true,
    this.viewBottomOpenDivider = true,
    this.viewBottomCloseDivider = false,
  });

  @override
  State<StatefulWidget> createState() => _Widget();
}

class _Widget extends State<PostCalendar> {
  late ValueNotifier<DateTime> selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = ValueNotifier(widget.selectedDate);

    if (widget.onChanged != null) {
      selectedDate.addListener(() {
        widget.onChanged!(selectedDate.value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool viewTopDivider = widget.state != PostCalendarFocused.shrink
        ? widget.viewTopOpenDivider
        : widget.viewTopCloseDivider;

    final bool viewBottomDivider = widget.state != PostCalendarFocused.shrink
        ? widget.viewBottomOpenDivider
        : widget.viewBottomCloseDivider;

    return Column(children: [
      if (viewTopDivider)
        Container(
          width: double.infinity,
          height: 0.3,
          color: Theme
              .of(context)
              .colorScheme
              .outline,
        ),
      Column(children: [
        AnimatedSize(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 300),
            child: switch (widget.state) {
              PostCalendarFocused.time =>
                  TimePicker(
                    selectedTime: selectedDate.value,
                    onChanged: (hour, minute) {
                      selectedDate.value = DateTime(
                        selectedDate.value.year,
                        selectedDate.value.month,
                        selectedDate.value.day,
                        hour,
                        minute,
                      );
                    },
                  ),
              PostCalendarFocused.date =>
                  ValueListenableBuilder(
                    valueListenable: selectedDate,
                    builder: (context, value, child) {
                      return TableCalendar(
                        focusedDay: value,
                        onDaySelected: (date, _) {
                          selectedDate.value = DateTime(
                            date.year,
                            date.month,
                            date.day,
                            selectedDate.value.hour,
                            selectedDate.value.minute,
                            selectedDate.value.second,
                          );
                        },
                        selectedDayPredicate: (date) => isSameDay(value, date),
                      );
                    },
                  ),
              PostCalendarFocused.shrink =>
                  SizedBox(
                    width: double.infinity,
                  ),
            }),
        if (viewBottomDivider)
          Container(
            width: double.infinity,
            height: 0.3,
            color: Theme
                .of(context)
                .colorScheme
                .outline,
          ),
      ])
    ]);
  }
}
