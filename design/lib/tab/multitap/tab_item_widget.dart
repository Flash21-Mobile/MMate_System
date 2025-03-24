import 'package:flutter/material.dart';

import '../../text/text_interface.dart';

class TabItemWidget extends StatelessWidget {
  final String text;
  final Color backGroundColor;
  final Color textColor;
  final bool? isFocus;

  const TabItemWidget(
      {super.key,
      required this.text,
      required this.backGroundColor,
      required this.textColor,
      this.isFocus});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: backGroundColor,
        width: 1,
      ))),
      child: IndexText(
        text,
        fontWeight: isFocus == true ? FontWeight.bold : FontWeight.normal,
        color: textColor,
      ),
    );
  }
}
