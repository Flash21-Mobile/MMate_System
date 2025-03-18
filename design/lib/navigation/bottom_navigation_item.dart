import 'package:design_system/navigation/bottom_navigation_item_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MMateBottomNavigationBarItem {
  final MMateBottomNavigationItemData data;

  const MMateBottomNavigationBarItem(this.data);

  BottomNavigationBarItem build(BuildContext context) {
    return BottomNavigationBarItem(
      icon: Padding(
          padding: EdgeInsets.only(bottom: 3),
          child: data.svgImage != null
              ? SvgPicture.asset(data.svgImage!,
                  width: 18,
                  height: 18,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onTertiary,
                    BlendMode.srcIn,
                  ))
              : SizedBox()),
      activeIcon: Padding(
          padding: EdgeInsets.only(bottom: 3),
          child: data.svgImage != null
              ? SvgPicture.asset(data.svgImage!,
                  width: 18,
                  height: 18,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ))
              : SizedBox()),
      label: data.label,
    );
  }
}
