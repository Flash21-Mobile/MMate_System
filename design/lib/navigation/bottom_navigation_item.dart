import 'package:design_system/navigation/bottom_navigation_item_data.dart';
import 'package:design_system/text/text_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MMateBottomNavigationBarItem extends StatelessWidget {
  final MMateBottomNavigationItemData data;
  final bool isClicked;

  const MMateBottomNavigationBarItem(
    this.data, {
    this.isClicked = false,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: data.svgImage != null
                ? SvgPicture.asset(data.svgImage!,
                    width: 18,
                    height: 18,
                    colorFilter: ColorFilter.mode(
                      isClicked
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).colorScheme.onTertiary,
                      BlendMode.srcIn,
                    ))
                : SizedBox(),
          ),
          IndexTextMin(
            data.label,
            color: isClicked
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.onTertiary,
          ),
        ]);
  }
}
