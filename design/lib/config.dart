import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppConfig {
  static const double bottomNavigationBarHeight = 48;

  static const double cardElevation = 4.0;
  static const double paddingIndex = 16.0;
  static EdgeInsets padding = EdgeInsets.all(paddingIndex);

  static EdgeInsets paddingHorizontal =
      EdgeInsets.symmetric(horizontal: paddingIndex);
  static EdgeInsets paddingVertical =
      EdgeInsets.symmetric(vertical: paddingIndex);

  static const double borderRadiusIndex = 16;
  static BorderRadius borderRadius = BorderRadius.circular(borderRadiusIndex);
  static BorderRadius borderRadiusTop = BorderRadius.only(
      topLeft: Radius.circular(borderRadiusIndex),
      topRight: Radius.circular(borderRadiusIndex));
  static BorderRadius borderRadiusBottom = BorderRadius.only(
      bottomLeft: Radius.circular(borderRadiusIndex),
      bottomRight: Radius.circular(borderRadiusIndex));

  static int alpha30 = (255 * 0.3).round();
  static int alpha50 = (255 * 0.5).round();
  static int alpha80 = (255 * 0.8).round();

  static final startCalendarDate = DateTime(1900);
  static final endCalendarDate = DateTime(2100, 12, 31);

  static SystemUiOverlayStyle systemStyle(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness:
          isDarkMode ? Brightness.light : Brightness.dark,
      systemNavigationBarContrastEnforced: false,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    );
  }
}
