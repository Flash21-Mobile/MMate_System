import 'package:core_system/app/app_data.dart';
import 'package:core_system/app/app_navigation_provider.dart';
import 'package:design_system/navigation/bottom_navigation_bar.dart';
import 'package:design_system/navigation/bottom_navigation_item.dart';
import 'package:design_system/navigation/bottom_navigation_item_data.dart';
import 'package:design_system/utilities/double_tap_to_close.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/utilities/navigation/navigation.dart';

class MMateApp extends ConsumerStatefulWidget {
  const MMateApp({
    super.key,
    this.data = const [],
    this.appBar,
    this.floatingButton,
  });

  final AppBar? appBar;
  final List<MMateAppData> data;
  final Widget? floatingButton;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Widget();
}

class _Widget extends ConsumerState<MMateApp> {
  @override
  Widget build(BuildContext context) {
    final navigationState = ref.watch(mMateAppNavigationProvider);
    final navigationNotifier = ref.read(mMateAppNavigationProvider.notifier);

    return DoubleTapToClose(
        beforePop: () {
          if (navigationState == 0) {
            return true;
          }
          navigationNotifier.state = 0;
          return false;
        },
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: widget.appBar,
          body: IndexedStack(
            index: navigationState,
            children:
                widget.data.map((e) => e.screen ?? Placeholder()).toList(),
          ),
          bottomNavigationBar: MMateBottomNavigationBar(
            currentIndex: navigationState,
            onTap: (index) {
              if (widget.data[index].onTap != null) {
                widget.data[index].onTap!();
              }
              if (widget.data[index].screen != null) {
                navigationNotifier.state = index;
              }
            },
            items: widget.data
                .map((e) => MMateBottomNavigationItemData(e.label,
                    svgImage: e.svgImage))
                .toList(),
          ),
          floatingActionButton: widget.floatingButton,
        ));
  }
}
