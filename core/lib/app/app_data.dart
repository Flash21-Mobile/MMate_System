import 'package:design_system/navigation/bottom_navigation_item.dart';
import 'package:flutter/cupertino.dart';

class MMateAppData {
  final Widget? screen;
  final Function()? onTap;
  final String? svgImage;
  final String? label;

  const MMateAppData({
    required this.screen,
    this.onTap,
    this.svgImage,
    this.label,
  });
}
