import 'dart:ui';

import 'package:design_system/config.dart';
import 'package:design_system/utilities/config.dart';
import 'package:flutter/material.dart';

import 'app_bar_bottom.dart';

class BlurAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;

  final AppBarBottom? bottom;
  final double appBarHeight;

  final double scrolledUnderElevation;
  final Color? backgroundColor;
  final Widget? child;

  const BlurAppBar(
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
              color: (backgroundColor ??
                      Theme.of(context).colorScheme.primaryContainer)
                  .withAlpha(180),
            ),
          ),
        )),
        AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: scrolledUnderElevation,
            toolbarHeight: appBarHeight,
            flexibleSpace: Padding(
                padding: IndexPadding(
                    top: MediaQuery.of(context).padding.top,
                    bottom: bottom?.height),
                child: Center(
                  child: child,
                )),
            systemOverlayStyle: AppConfig.systemStyle(context),
            bottom: bottom),
      ],
    );
  }
}
