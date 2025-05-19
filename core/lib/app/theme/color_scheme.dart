part of '_app_theme_data.dart';

class _ColorScheme {
  static const light = ColorScheme(
    brightness: Brightness.light,
    primary: _ThemePalette.primaryColor,
    onPrimary: Colors.white,
    primaryFixed: _ThemePalette.secondaryColor,
    secondary: _ThemePalette.secondaryColor,
    onSecondary: _ThemePalette.primaryColor,
    tertiary: Color(0xFFE4E4E4),
    onTertiary: Color(0xFF707070),
    error: Color(0xFFF44336),
    onError: Colors.black,
    surface: Color(0xFFE4E4E4),
    onSurface: Color(0xFF707070),
    primaryContainer: Colors.white,
    onPrimaryContainer: Colors.black,
    secondaryContainer: Color(0xFFF5F6F8),
    onSecondaryContainer: Colors.black,
    outline: Color(0xFFE4E4E4),
  );

  static final dark = ColorScheme(
    brightness: Brightness.dark,
    primary:_ThemePalette._desaturate(_ThemePalette.primaryColor),
    onPrimary: Colors.white,
    primaryFixed: _ThemePalette.secondaryColor,
    secondary: const Color(0xFF61616D),
    onSecondary: const Color(0xFF2C2C36),
    tertiary: const Color(0xFF2C2C36),
    onTertiary: const Color(0xFF61616D),
    error: _ThemePalette._desaturate(const Color(0xFFF44336)),
    onError: const Color(0xFFFFFFFF),
    surface: Color(0xFF2C2C36),
    onSurface: Color(0xFF61616D),
    primaryContainer: const Color(0xFF202126),
    onPrimaryContainer: Colors.white,
    secondaryContainer: const Color(0xFFF5F6F8),
    onSecondaryContainer: Colors.black,
    outline: const Color(0xFFE4E4E4),
  );
}
