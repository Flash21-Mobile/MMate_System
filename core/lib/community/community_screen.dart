import 'package:core_system/community/provider/article/article_tab_provider.dart';
import 'package:core_system/community/provider/board/board_provider.dart';
import 'package:design_system/tab/multitap/tab_bar_widget.dart';
import 'package:design_system/tab/multitap/tab_item.dart';
import 'package:design_system/tab/multitap/tab_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'community_tab.dart';

class CommunityScreen extends ConsumerStatefulWidget {
  const CommunityScreen({super.key});

  @override
  ConsumerState<CommunityScreen> createState() => _Screen();
}

class _Screen extends ConsumerState<CommunityScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final boards = ref.read(boardProvider);

    _tabController =
        TabController(length: (boards.data ?? []).length, vsync: this);

    _tabController.index = ref.read(articleTapProvider);
    _tabController.addListener(() {
      if (ref.read(articleTapProvider) != _tabController.index) {
        ref.read(articleTapProvider.notifier).state = _tabController.index;
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final boards = ref.read(boardProvider);

    final tabs = boards.data?.asMap().entries.map((entry) {
      return TabItem(
          index: entry.key,
          name: entry.value.name,
          tabWidget: CommunityTab(entity: entry.value));
    }).toList()??[];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        TabBarWidget(controller: _tabController, tabItems: tabs),
        Expanded(
            child: TabViewWidget(controller: _tabController, tabItems: tabs))
      ]),
    );
  }
}
