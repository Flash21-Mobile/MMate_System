import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MMateBottomNavigationItemData {
  final String? svgImage;
  final String label;

  const MMateBottomNavigationItemData(
    this.label, {
    this.svgImage,
  });
}
