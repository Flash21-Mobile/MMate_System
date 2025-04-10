import 'package:flutter/material.dart';

class TableCalendarSelectedCell extends StatefulWidget {
  final String text;
  final bool isToday;
  final EdgeInsets padding;
  final Alignment alignment;

  const TableCalendarSelectedCell(
    this.text,
    this.isToday,
    this.padding,
    this.alignment, {
    super.key,
  });

  @override
  State<TableCalendarSelectedCell> createState() => _Widget();
}

class _Widget extends State<TableCalendarSelectedCell> {
  bool isAnimate = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isAnimate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.bounceInOut,
      duration: Duration(milliseconds: 200),
      margin: isAnimate
          ? EdgeInsets.symmetric(horizontal: 2)
          : EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      // margin: EdgeInsets.symmetric(horizontal: 2),
      padding: widget.padding,
      decoration: BoxDecoration(
        color: isAnimate
            ? widget.isToday
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: isAnimate ? 12 : 6, // 그림자 점점 줄이기
            spreadRadius: isAnimate ? 12 : 6,
            color: Theme.of(context).unselectedWidgetColor.withOpacity(0.5),
            offset: Offset(0, 8),
          )
        ],
      ),
      alignment: widget.alignment,
      child: Text(
        widget.text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 17.0,
        ),
      ),
    );
  }
}
