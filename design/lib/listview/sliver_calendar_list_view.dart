import 'package:design_system/calendar/table/calendar_table.dart';
import 'package:design_system/calendar/table/table_calendar_style.dart';
import 'package:design_system/listview/list_view_abstract_interface.dart';
import 'package:design_system/listview/list_view_interface.dart';
import 'package:design_system/listview/sliver_calendar_list_view_provider.dart';
import 'package:design_system/listviewitem/list_view_item_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../calendar/table/table_calendar_builders.dart';
import '../calendar/table/table_calendar_utiles.dart';
import '../calendar/table/table_calendar_week_style.dart';
import '../dialog/bottom_sheet_list_radio_dialog.dart';
import '../text/text_interface.dart';

class SliverCalendarListView<T> extends ListViewAbstractInterface<T> {
  final List<DateTime> eventsList;
  final bool Function(T? data, DateTime selectedDate) comparable;

  const SliverCalendarListView(
      {super.key,
      required super.data,
      required super.itemBuilder,
      required super.separateWidget,
      required this.comparable,
      super.padding,
      required this.eventsList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarState = ref.watch(sliverCalendarListViewProvider);
    final calendarViewmodel = ref.read(sliverCalendarListViewProvider.notifier);

    if (data == null) {
      return SizedBox();
    }

    if (data!.isEmpty) {
      return CustomScrollView(slivers: [
        SliverFillRemaining(child: Center(child: IndexText(emptyText)))
      ]);
    }

    final resultData =
        data!.where((e) => comparable(e, calendarState)).toList();

    return Container(
        width: width,
        height: height,
        child: CustomScrollView(
            scrollDirection: scrollDirection,
            controller: controller,
            shrinkWrap: shrinkWrap,
            slivers: [
              SliverToBoxAdapter(
                  child: Container(
                      padding: padding,
                      child: TableCalendar(
                          focusedDay: calendarState,
                          firstDay: DateTime(2000),
                          lastDay: DateTime(2050, 12, 31),
                          eventsList: eventsList,
                          onDaySelected: (selectedDay, _) {
                            calendarViewmodel.set = selectedDay;
                          },
                          selectedDayPredicate: (date) =>
                              isSameDay(calendarState, date),
                          onTapHeaderYear: (focusedDay) {
                            final yearList =
                                List.generate(30, (index) => '${2010 + index}');
                            BottomSheetListRadioDialog(
                              context: context,
                              headerPinned: true,
                              autoFocus: true,
                              selectedValue:
                                  yearList.indexOf('${focusedDay.year}'),
                              onChanged: (index) {
                                calendarViewmodel.set = DateTime(
                                    int.parse(yearList[index]),
                                    calendarState.month,
                                    calendarState.day);
                              },
                              items: yearList,
                              title: '연도를 선택하세요',
                            ).show();
                          },
                          onTapHeaderMonth: (focusedDay) {
                            final monthList =
                                List.generate(12, (index) => '${index + 1}');
                            BottomSheetListRadioDialog(
                              context: context,
                              initialSize: 0.8,
                              headerPinned: false,
                              selectedValue:
                                  monthList.indexOf('${focusedDay.month}'),
                              onChanged: (index) {
                                calendarViewmodel.set = DateTime(
                                    calendarState.year,
                                    int.parse(monthList[index]),
                                    calendarState.day);
                              },
                              items: monthList,
                              title: '월를 선택하세요',
                            ).show();
                          }))),
              SliverList.separated(
                  itemBuilder: (context, index) => Container(
                      padding: padding,
                      child: itemBuilder(resultData[index], index)),
                  separatorBuilder: (_, __) => separateWidget ?? SizedBox(),
                  itemCount: resultData.length)
            ]));
  }
}
