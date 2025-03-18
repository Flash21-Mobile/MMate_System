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

    return SizedBox(
        height: 48 + bottomPadding,
        child: BottomNavigationBar(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            onTap: onTap,
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 11,
            unselectedFontSize: 11,
            elevation: 5,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Theme.of(context).colorScheme.onTertiary,
            showUnselectedLabels: true,
            items: items
                .map((e) => MMateBottomNavigationBarItem(e).build(context))
                .toList()));
  }
}
