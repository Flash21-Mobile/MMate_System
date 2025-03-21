import 'package:design_system/text/text_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final DateTime selectedTime;
  final Function(int hour, int min)? onChanged;

  const TimePicker({
    super.key,
    required this.selectedTime,
    this.onChanged,
  });

  @override
  State<StatefulWidget> createState() => _Widget();
}

class _Widget extends State<TimePicker> {
  late int _period;
  final _periodLists = ['오전', '오후'];
  late int _hour;

  late ValueNotifier<DateTime> selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = ValueNotifier(widget.selectedTime);

    _period = selectedTime.value.hour >= 12 ? 1 : 0;
    final temp = selectedTime.value.hour > 12
        ? selectedTime.value.hour - 12
        : selectedTime.value.hour;
    _hour = temp == 0 ? 12 : temp;

    if (widget.onChanged != null) {
      selectedTime.addListener(() {
        widget.onChanged!(selectedTime.value.hour, selectedTime.value.minute);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(children: [
        // 오전, 오후
        SizedBox(
            height: 160,
            width: constraints.maxWidth / 3,
            child: CupertinoPicker(
                itemExtent: 30.0,
                selectionOverlay: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .tertiary
                            .withAlpha(100),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ))),
                scrollController:
                    FixedExtentScrollController(initialItem: _period),
                // todo d: 이거도 확인
                onSelectedItemChanged: (index) {
                  setState(() {
                    _period = index;
                  });

                  final hour = _period == 0
                      ? (_hour == 12 ? 0 : _hour)
                      : (_hour == 12 ? 12 : _hour + 12);

                  selectedTime.value = selectedTime.value = DateTime(
                    selectedTime.value.year,
                    selectedTime.value.month,
                    selectedTime.value.day,
                    hour,
                    selectedTime.value.minute,
                  );
                },
                children: List.generate(2, (index) {
                  return Center(
                      child: IndexTextThumb(
                    _periodLists[index],
                  ));
                }))),

        // 시각
        Container(
            height: 160,
            width: constraints.maxWidth / 3,
            child: CupertinoPicker(
                itemExtent: 30.0,
                selectionOverlay: Container(
                    color:
                        Theme.of(context).colorScheme.tertiary.withAlpha(100)),
                scrollController:
                    FixedExtentScrollController(initialItem: _hour - 1),
                onSelectedItemChanged: (index) {
                  setState(() {
                    _hour = index + 1;
                  });
                  final hour = _period == 0
                      ? (_hour == 12 ? 0 : _hour)
                      : (_hour == 12 ? 12 : _hour + 12);

                  selectedTime.value = selectedTime.value = DateTime(
                    selectedTime.value.year,
                    selectedTime.value.month,
                    selectedTime.value.day,
                    hour,
                    selectedTime.value.minute,
                  );
                },
                children: List.generate(12, (index) {
                  return Center(
                      child: IndexTextThumb(
                    '${index + 1}', // todo d: 이거 오전에도 괜찮은지 확인
                  ));
                }))),

        // 분
        Container(
            height: 160,
            width: constraints.maxWidth / 3,
            child: CupertinoPicker(
                itemExtent: 30.0,
                selectionOverlay: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .tertiary
                            .withAlpha(100),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ))),
                scrollController: FixedExtentScrollController(
                    initialItem: selectedTime.value.minute),
                onSelectedItemChanged: (index) {
                  selectedTime.value = DateTime(
                    selectedTime.value.year,
                    selectedTime.value.month,
                    selectedTime.value.day,
                    selectedTime.value.hour,
                    index,
                  );
                },
                children: List.generate(60, (index) {
                  return Center(
                      child: IndexTextThumb(
                    '$index',
                  ));
                }))),
      ]);
    });
  }
}
