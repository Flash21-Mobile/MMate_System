import 'package:design_system/tab/multitap/tab_item.dart';
import 'package:flutter/material.dart';

class TabViewWidget extends StatelessWidget {
  final TabController? controller;
  final List<TabItem> tabItems;

  const TabViewWidget({
    super.key,
    required this.controller,
    required this.tabItems,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: tabItems.map((value) => value.tabWidget).toList(),
    );
  }
}
