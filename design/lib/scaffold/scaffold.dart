import 'dart:ui';

import 'package:design_system/button/button_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../animate/ink_well.dart';
import '../config.dart';
import '../text/text_interface.dart';

class MMateScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final MMateButtonData? bottomMMateButton;
  final bool isBottomMMateButtonVisible;
  final Color? backgroundColor;

  const MMateScaffold(
    BuildContext context, {
    super.key,
    this.appBar,
    this.body,
    this.backgroundColor,
    this.bottomMMateButton,
    this.isBottomMMateButtonVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.primaryContainer,
          body: Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: true,
            backgroundColor: Colors.transparent,
            appBar: appBar,
            body: body ?? SizedBox(),
            bottomNavigationBar: bottomMMateButton != null
                ? AnimatedOpacity(
                    duration: isKeyboardVisible && isBottomMMateButtonVisible
                        ? Duration(milliseconds: 300)
                        : Duration.zero,
                    opacity: !isBottomMMateButtonVisible && isKeyboardVisible
                        ? 0
                        : 1,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: isKeyboardVisible
                          ? EdgeInsets.zero
                          : EdgeInsets.only(
                              left: AppConfig.paddingIndex,
                              right: AppConfig.paddingIndex,
                              bottom: MediaQuery.of(context).padding.bottom +
                                  AppConfig.paddingIndex,
                            ),
                      curve: Curves.easeInOut,
                      child: () {
                        final child = Container(
                          height: 55,
                          alignment: Alignment.center,
                          child: IndexText(
                            bottomMMateButton!.data,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        );
                        return isKeyboardVisible
                            ? Material(
                                color: Theme.of(context).colorScheme.primary,
                                child: InkWell(
                                  onTap: bottomMMateButton!.onTap,
                                  child: child,
                                ),
                              )
                            : MMateInkWell(
                                onTap: bottomMMateButton!.onTap,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  child: child,
                                ),
                              );
                      }(),
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }
}
