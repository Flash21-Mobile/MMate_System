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
  });

  final AppBar? appBar;
  final List<MMateAppData> data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Widget();
}

class _Widget extends ConsumerState<MMateApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 현재 모드 감지 (라이트/다크)
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: isDarkMode ? Colors.black : Colors.white,
      systemNavigationBarIconBrightness:
          isDarkMode ? Brightness.light : Brightness.dark,
    ));
  }

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
            appBar: widget.appBar,
            body: IndexedStack(
              index: navigationState,
              children: widget.data.map((e) => e.screen).toList(),
            ),
            bottomNavigationBar: widget.data.length < 2
                ? SizedBox()
                : MMateBottomNavigationBar(
                    currentIndex: navigationState,
                    onTap: (index) => navigationNotifier.state = index,
                    items: widget.data
                        .map((e) => MMateBottomNavigationItemData(e.label,
                            svgImage: e.svgImage))
                        .toList(),
                  )));
    //   DoubleTapToClose(child:  Scaffold(
    //   body:  IndexedStack(
    //         index: navigationState,
    //         children: widget.data
    //             .map((e) => Navigator(
    //                 onGenerateRoute: (settings) =>
    //                     MaterialPageRoute(builder: (_) => e.screen)))
    //             .toList(),
    //       ),
    //   bottomNavigationBar: MMateBottomNavigationBar(
    //     currentIndex: navigationState,
    //     onTap: (index) => navigationNotifier.state = index,
    //     items: widget.data
    //         .map((e) => MMateBottomNavigationItem(
    //               svgImage: e.svgImage,
    //               label: e.label,
    //             ))
    //         .toList(),
    //   ))
    // );
  }
}
