import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../text/text_interface.dart';

class BottomSheetHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final VoidCallback? onBack;

  BottomSheetHeaderDelegate({required this.title, this.onBack});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final primaryColor = Theme.of(context).primaryColor;
    return  Container(
      color: Colors.white, // 배경색 추가 (필요하면 변경 가능)
      child: SizedBox(
        height: minExtent,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 8),
                Material(
                    color: Colors.transparent,
                    child: onBack == null
                        ? null
                        : InkWell(
                            onTap: onBack,
                            borderRadius: BorderRadius.circular(100),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.arrow_back_ios_rounded,
                                      size: 16, color: primaryColor),
                                  Container(
                                      child: IndexText(
                                    '뒤로',
                                    color: primaryColor,
                                  ))
                                ],
                              ),
                            ),
                          ))
              ],
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
