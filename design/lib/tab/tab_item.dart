import 'package:flutter/cupertino.dart';

class TabItem {
  final int index;
  final String name;
  final Widget tabWidget; //todo d: 인터페이스로 받기

  TabItem({
    required this.index,
    required this.name,
    required this.tabWidget,
  });
}
