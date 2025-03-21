import 'package:flutter/material.dart';

class MmateTheme {
  final Color background;

  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color tertiary;
  final Color onTertiary;

  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondaryContainer;
  final Color onSecondaryContainer;

  final Color error;
  final Color onError;

  final Color surface;
  final Color onSurface;

  /// 구분선 색성
  final Color outline;

  /// Primary 보조 색성
  final Color primaryFixed;

  final Brightness brightness;

  const MmateTheme._({
    required this.background,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.tertiary,
    required this.onTertiary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.error,
    required this.onError,
    required this.surface,
    required this.onSurface,
    required this.outline,
    required this.primaryFixed,
    required this.brightness,
  });

  factory MmateTheme.light({
    background = const Color(0xFFF5F6F8),
    primary = const Color(0xFF1979E4),
    onPrimary = const Color(0xFFFFFFFF),
    secondary = const Color(0xFFD7EAFF),
    onSecondary = const Color(0xFF1979E4),
    tertiary = const Color(0xFFD9D9D9),
    onTertiary = const Color(0xFFA5A5A5),
    primaryContainer = const Color(0xFFFFFFFF),
    onPrimaryContainer = const Color(0xFF000000),
    secondaryContainer = const Color(0xFFF5F6F8),
    onSecondaryContainer = const Color(0xFF000000),
    error = const Color(0xFFF44336),
    onError = const Color(0xFFFFFFFF),
    surface = const Color(0xFFFFFFFF),
    onSurface = const Color(0xFF000000),
    outline = const Color(0xFFE4E4E4),
    primaryFixed = const Color(0xFFD7EAFF),
  }) {
    return MmateTheme._(
      background: background,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      tertiary: tertiary,
      onTertiary: onTertiary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      error: error,
      onError: onError,
      surface: surface,
      onSurface: onSurface,
      outline: outline,
      primaryFixed: primaryFixed,
      brightness: Brightness.light,
    );
  }

  factory MmateTheme.dark({
    background = const Color(0xFFF5F6F8),
    primary = const Color(0xFF1979E4),
    onPrimary = const Color(0xFFFFFFFF),
    secondary = const Color(0xFFD7EAFF),
    onSecondary = const Color(0xFF1979E4),
    tertiary = const Color(0xFFD9D9D9),
    onTertiary = const Color(0xFFA5A5A5),
    primaryContainer = const Color(0xFFFFFFFF),
    onPrimaryContainer = const Color(0xFF000000),
    secondaryContainer = const Color(0xFFF5F6F8),
    onSecondaryContainer = const Color(0xFF000000),
    error = const Color(0xFFF44336),
    onError = const Color(0xFFFFFFFF),
    surface = const Color(0xFFFFFFFF),
    onSurface = const Color(0xFF000000),
    outline = const Color(0xFFE4E4E4),
    primaryFixed = const Color(0xFFD7EAFF),
  }) {
    return MmateTheme._(
      background: background,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      tertiary: tertiary,
      onTertiary: onTertiary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      error: error,
      onError: onError,
      surface: surface,
      onSurface: onSurface,
      outline: outline,
      primaryFixed: primaryFixed,
      brightness: Brightness.dark,
    );
  }

  ThemeData themeData() {
    return ThemeData(
        scaffoldBackgroundColor: background,
        appBarTheme: AppBarTheme(
          backgroundColor: background,
        ),
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: primary,
          onPrimary: onPrimary,
          primaryFixed: primaryFixed,
          secondary: secondary,
          onSecondary: onSecondary,
          tertiary: tertiary,
          onTertiary: onTertiary,
          error: error,
          onError: onError,
          surface: surface,
          onSurface: onSurface,
          primaryContainer: primaryContainer,
          onPrimaryContainer: onPrimaryContainer,
          secondaryContainer: secondaryContainer,
          onSecondaryContainer: onSecondaryContainer,
          outline: outline,
        ));
  }
}
