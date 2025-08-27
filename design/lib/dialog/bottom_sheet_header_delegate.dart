import 'package:design_system/animate/ink_well.dart';
import 'package:design_system/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../text/text_interface.dart';

class BottomSheetHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final VoidCallback? onBack;
  final List<Widget> actionButtons;

  BottomSheetHeaderDelegate({
    required this.title,
    this.onBack,
    this.actionButtons = const [],
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: SizedBox(
        height: minExtent,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 8),
                if (onBack != null)
                  MMateInkWell(
                    enableSplash: false,
                    borderRadius: AppConfig.borderRadius,
                    onTap: onBack,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 16,
                            color: primaryColor,
                          ),
                          Container(
                              child: IndexText(
                            '뒤로',
                            color: primaryColor,
                          )),
                        ],
                      ),
                    ),
                  )
              ],
            ),

            Row(
              children: [
                Spacer(),
                ...actionButtons.expand((e) => [
                  SizedBox(width: AppConfig.paddingIndex,),
                      SizedBox(width: AppConfig.paddingIndex / 2),
                      e,
                    ]),SizedBox(width: 8)]
            ),
            Align(
                alignment: Alignment.center,
                child: IndexText(title, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 56; // 최대 높이

  @override
  double get minExtent => 56; // 최소 높이

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
