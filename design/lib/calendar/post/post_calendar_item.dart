import 'package:design_system/calendar/post/post_calendar_focused.dart';
import 'package:design_system/config.dart';
import 'package:design_system/text/text_interface.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostCalendarItem extends StatefulWidget {
  final DateTime dateTime;
  final Function(PostCalendarFocused onFocused) onTap;

  const PostCalendarItem({
    super.key,
    required this.dateTime,
    required this.onTap,
  });

  @override
  State<StatefulWidget> createState() => _Widget();
}

class _Widget extends State<PostCalendarItem> {
  PostCalendarFocused state = PostCalendarFocused.shrink;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      InkWell(
        onTap: () {
          if (state == PostCalendarFocused.date) {
            state = PostCalendarFocused.shrink;
          } else {
            state = PostCalendarFocused.date;
          }

          widget.onTap(state);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: AppConfig.paddingIndex / 2, vertical: 5),
          child: IndexText(
            DateFormat('yyyy. MM. dd.', 'ko_KR').format(widget.dateTime),
            color: state == PostCalendarFocused.date
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
      ),
      SizedBox(width: 5),
      InkWell(
        onTap: () {
          if (state == PostCalendarFocused.time) {
            state = PostCalendarFocused.shrink;
          } else {
            state = PostCalendarFocused.time;
          }
          widget.onTap(state);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: AppConfig.paddingIndex / 2, vertical: 5),
          child: IndexText(
            DateFormat('a hh:mm', 'ko_KR').format(widget.dateTime),
            color: state == PostCalendarFocused.time
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
      ),
    ]);
  }
}
