import 'dart:ui';

import 'package:design_system/appbar/app_bar_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config.dart';
import '../utilities/config.dart';

class MMateAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;

  final MMateAppBarBottom? bottom;
  final double appBarHeight;

  final double scrolledUnderElevation;
  final Color? backgroundColor;
  final Widget? child;

  const MMateAppBar(
    this.context, {
    super.key,
    this.appBarHeight = 56,
    this.bottom,
    this.scrolledUnderElevation = 0,
    this.backgroundColor,
    this.child,
  });

  @override
  Size get preferredSize => Size.fromHeight(
        appBarHeight + (bottom?.height ?? 0),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              color: backgroundColor ??
                  Theme.of(context).colorScheme.primaryContainer.withAlpha(10),
            ),
          ),
        )),
        AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: scrolledUnderElevation,
            toolbarHeight: appBarHeight,
            flexibleSpace: Padding(
                padding: IndexPadding(top: MediaQuery.of(context).padding.top),
                child: Center(
                  child: child,
                )),
            systemOverlayStyle: AppConfig.systemStyle(context),
            bottom: bottom),
      ],
    );
  }
}
