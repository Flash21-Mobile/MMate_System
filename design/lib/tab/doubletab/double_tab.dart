import 'package:design_system/animate/ink_well.dart';
import 'package:design_system/config.dart';
import 'package:design_system/tab/doubletab/double_tab_item.dart';
import 'package:design_system/text/text_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DoubleTapBar extends StatefulWidget {
  final List<DoubleTabItem> items;
  final Function(int index)? onChanged;

  const DoubleTapBar({
    super.key,
    required this.items,
    this.onChanged,
  });

  @override
  State<StatefulWidget> createState() => _Widget();
}

class _Widget extends State<DoubleTapBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.items.length, vsync: this);
    if (widget.onChanged != null) {
      _tabController.addListener(() => widget.onChanged!(_tabController.index));
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: AppConfig.paddingHorizontal,
            child: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(13.5)),
                padding: EdgeInsets.all(4),
                child: TabBar(
                  splashFactory: NoSplash.splashFactory,
                  dividerHeight: 0,
                  controller: _tabController,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  tabs: widget.items.map((e) {
                    return Tab(
                      child: Text(e.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14)),
                    );
                  }).toList(),
                  labelStyle: TextStyle(color: Colors.black),
                  unselectedLabelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.tertiary,
                        offset: Offset(0.5, 0.5),
                        blurRadius: 0.6,
                        spreadRadius: 0.2,
                      )
                    ],
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  splashBorderRadius: AppConfig.borderRadiusTop,
                ))),
        Expanded(
            child: Stack(alignment: Alignment.topCenter, children: [
          TabBarView(
              controller: _tabController,
              children: widget.items.map((e) => e.tab).toList()),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.white.withAlpha(150),
                Colors.white.withAlpha(0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            width: double.infinity,
            height: AppConfig.paddingIndex,
          )
        ])),
      ],
    );
  }
}
