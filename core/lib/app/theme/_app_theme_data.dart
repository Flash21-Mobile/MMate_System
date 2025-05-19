library;

import 'dart:ui';

import 'package:flutter/material.dart';

part 'theme_palette.dart';

part 'app_bar_theme.dart';

part 'color_scheme.dart';

class AppThemeData {
  static final light = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF5F6F8),
    unselectedWidgetColor: const Color(0xFFE8EAEB),
    appBarTheme: _AppBarTheme.light,
    colorScheme: _ColorScheme.light,
  );

  static final dark = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF18171C),
    unselectedWidgetColor: const Color(0xFFE8EAEB),
    appBarTheme: _AppBarTheme.dark,
    colorScheme: _ColorScheme.dark,
  );
}
