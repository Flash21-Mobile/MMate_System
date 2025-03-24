import 'package:design_system/tab/multitap/tab_item.dart';
import 'package:design_system/tab/multitap/tab_item_widget.dart';
import 'package:flutter/material.dart';

import '../../config.dart';

class TabBarWidget extends StatefulWidget {
  final List<TabItem> tabItems;
  final TabController controller;
  final EdgeInsets? padding;
  final Color? selectedColor;
  final Color unSelectedColor;

  const TabBarWidget(
      {super.key,
      required this.tabItems,
      required this.controller,
      this.selectedColor,
      this.unSelectedColor = Colors.black,
      this.padding});

  @override
  State<StatefulWidget> createState() => _Widget();
}

class _Widget extends State<TabBarWidget> {
  late int activeTabIndex;

  @override
  void initState() {
    super.initState();
    activeTabIndex = widget.controller.index;
    widget.controller.addListener(() {
      setState(() {
        activeTabIndex = widget.controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.controller.animation!,
        builder: (context, child) {
          return TabBar(
              isScrollable: true,
              controller: widget.controller,
              labelPadding: EdgeInsets.symmetric(
                  horizontal: 0),
              indicator: BoxDecoration(),
              padding: widget.padding ?? AppConfig.paddingHorizontal,
              tabs: widget.tabItems.map((value) {
                double t = (widget.controller.animation!.value - value.index);
                Color textColor = generateColor(
                    selectedColor:
                        widget.selectedColor ?? Theme.of(context).primaryColor,
                    unSelectedColor: widget.unSelectedColor,
                    position: t);

                Color backgroundColor = generateColor(
                    selectedColor:
                        widget.selectedColor ?? Theme.of(context).primaryColor,
                    unSelectedColor: Theme.of(context).dividerColor,
                    position: t);

                return TabItemWidget(
                  text: value.name,
                  backGroundColor: backgroundColor,
                  textColor: textColor,

                  isFocus: value.index == (widget.controller.animation!.value - 0.01).round(),
                );
              }).toList());
        });
  }

  Color generateColor(
      {required Color selectedColor,
      required Color unSelectedColor,
      required double position}) {
    return Color.lerp(
        unSelectedColor,
        selectedColor,
        position >= 0
            ? (1 - position).clamp(0, 1)
            : position >= -1
                ? 1 + position
                : 0)!;
  }
}
