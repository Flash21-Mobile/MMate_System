import 'dart:ui';

import 'package:design_system/config.dart';
import 'package:design_system/navigation/bottom_navigation_item_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'bottom_navigation_item.dart';

class MMateBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<MMateBottomNavigationItemData> items;

  const MMateBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final bottomNavigationBarHeight = 48 + bottomPadding;

    return SizedBox(
        height: bottomNavigationBarHeight,
        child: ClipRRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer.withAlpha(165),
                  padding: EdgeInsets.only(bottom: bottomPadding),
                  child: Row(
                      children: items
                          .asMap()
                          .entries
                          .map((e) => Expanded(
                              child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      borderRadius: AppConfig.borderRadius,
                                      onTap: () => onTap(e.key),
                                      child: MMateBottomNavigationBarItem(
                                        e.value,
                                        isClicked: currentIndex == e.key,
                                      )))))
                          .toList()),
                ))));
  }
}
