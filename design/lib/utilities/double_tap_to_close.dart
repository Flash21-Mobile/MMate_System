import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../text/text_interface.dart';

class DoubleTapToClose extends ConsumerStatefulWidget {
  final Widget child;
  final bool canPop;
  final bool Function()? beforePop;

  const DoubleTapToClose(
      {super.key, required this.child, this.canPop = false, this.beforePop});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Widget();
}

class _Widget extends ConsumerState<DoubleTapToClose> {
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: widget.canPop
          ? null
          : (didPop, result) {
              final result = onWillPop();
              if (result) {
                SystemNavigator.pop();
              }
            },
      child: widget.child,
    );
  }

  bool onWillPop() {
    if (widget.beforePop == null ? false : !widget.beforePop!()) {
      return false;
    }
    DateTime now = DateTime.now();

    if (currentBackPressTime != null &&
        now.difference(currentBackPressTime!) < Duration(seconds: 2)) {
      return true;
    }

    currentBackPressTime = now;
    final msg = "'뒤로'버튼을 한 번 더 누르면 종료됩니다.";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: IndexText(
          msg,
          color: Colors.white,
        ),
        duration: Duration(milliseconds: 1500),
      ),
    );
    return false;
  }
}
