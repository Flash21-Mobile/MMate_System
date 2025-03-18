import 'package:design_system/text/text_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../table/calendar_table.dart';
import '../table/table_calendar_utiles.dart';

class CalendarDialog extends ConsumerStatefulWidget {
  final BuildContext context;
  final DateTime? selectedDate;
  final String title;

  const CalendarDialog(
    this.context,
    this.title, {
    super.key,
    this.selectedDate,
  });

  Future<DateTime?> show() async {
    final dateTime = await showDialog<DateTime>(
            context: context,
            builder: (context) {
              return CalendarDialog(
                context,
                title,
                selectedDate: selectedDate,
              );
            }) ??
        selectedDate;

    return dateTime;
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Widget();
}

class _Widget extends ConsumerState<CalendarDialog> {
  late DateTime _selectedDate;

  DateTime get selectedDate => _selectedDate;

  set setSelectedData(DateTime dateTime) {
    setState(() {
      _selectedDate = dateTime;
    });
  }

  @override
  void initState() {
    super.initState();

    _selectedDate = widget.selectedDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                alignment: Alignment.center,
                color: Colors.transparent,
                margin: EdgeInsets.all(15),
                child: datePiker())));
  }

  Widget datePiker() {
    return InkWell(
        onTap: () {},
        child: Container(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 30, top: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IndexTextMax(widget.title, fontWeight: FontWeight.bold),
                TableCalendar(
                  locale: 'ko_KR',
                  focusedDay: selectedDate,
                  firstDay: DateTime(1900),
                  lastDay: DateTime(2050, 12, 31),
                  onDaySelected: (selectedDay, _) {
                    setState(() {
                      setSelectedData = selectedDay;
                    });
                  },
                  selectedDayPredicate: (date) => isSameDay(selectedDate, date),
                  onPageChanged: (focusedDay) {
                    setState(() {
                      setSelectedData = focusedDay;
                    });
                  },
                ),
                SizedBox(height: 30),
                InkWell(
                    onTap: () {
                      Navigator.pop(context, selectedDate);
                    },
                    child: Container(
                        width: double.infinity,
                        child: IndexText(
                          '확인',
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(100))))
              ],
            )));
  }


  Future<void> _selectYear(BuildContext context, int currentYear) async {
    final ScrollController scrollController = ScrollController();

    final selectedYear = await showDialog<int>(
      context: context,
      builder: (context) {
        // 대화상자 내에서 선택된 연도로 자동 스크롤을 이동
        Future.delayed(Duration.zero, () {
          final selectedIndex = currentYear - 1900;
          scrollController.jumpTo(selectedIndex * 50 - 50); // 아이템 높이에 맞춰 스크롤 이동
        });

        return AlertDialog(
          title: const Text('연도를 선택하세요'),
          content: SizedBox(
            height: 300,
            width: 200,
            child: ListView.builder(
              controller: scrollController,
              itemCount: 151, // 1900년부터 2050년까지
              itemBuilder: (_, index) {
                final year = 1900 + index;
                bool isSelected = year == currentYear; // 선택된 연도

                return InkWell(
                    onTap: () {
                      Navigator.of(context).pop(year);
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: isSelected
                              ? Theme.of(context).primaryColor.withAlpha(170)
                              : null,
                          borderRadius: BorderRadius.circular(15)),
                      // 선택된 항목 배경색
                      child: Text('$year년'),
                    ));
              },
            ),
          ),
        );
      },
    );
    if (selectedYear != null) {
      setState(() {
        setSelectedData =
            DateTime(selectedYear, selectedDate.month, selectedDate.day);
      });
    }
  }

  Future<void> _selectMonth(BuildContext context, int currentMonth) async {
    final ScrollController scrollController = ScrollController();

    final selectedMonth = await showDialog<int>(
      context: context,
      builder: (context) {
        Future.delayed(Duration.zero, () {
          final selectedIndex = currentMonth;
          if (selectedIndex > 3 && selectedIndex < 8) {
            scrollController
                .jumpTo((selectedIndex - 2) * 50); // 아이템 높이에 맞춰 스크롤 이동
          } else if (selectedIndex >= 8) {
            scrollController.jumpTo(50 * 6);
          }
        });

        return AlertDialog(
          title: const Text('월을 선택하세요'),
          content: SizedBox(
            height: 300,
            width: 200,
            child: ListView.builder(
              controller: scrollController,
              itemCount: 12, // 1월부터 12월까지
              itemBuilder: (_, index) {
                final month = index + 1;
                bool isSelected = month == currentMonth;
                return InkWell(
                    onTap: () => Navigator.of(context).pop(month),
                    child: Container(
                        height: 50,
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 15),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: isSelected
                                ? Theme.of(context).primaryColor.withAlpha(170)
                                : null,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text('$month월')));
              },
            ),
          ),
        );
      },
    );

    if (selectedMonth != null) {
      setState(() {
        setSelectedData =
            DateTime(selectedDate.year, selectedMonth, selectedDate.day);
      });
    }
  }
}
