part of '_app_theme_data.dart';

abstract class _ThemePalette {

  abstract Color primaryColor;
  abstract Color secondaryColor;
  abstract Color onSurfaceColor;

  Color _desaturate(Color color) {
    final hsl = HSLColor.fromColor(color);
    final adjustedHsl = hsl
        .withSaturation((hsl.saturation * 0.9).clamp(0.0, 1.0))
        .withLightness((hsl.lightness * 1.15).clamp(0.0, 1.0));
    return adjustedHsl.toColor();
  }
}

class _LightThemePalette extends _ThemePalette {
  @override
  Color primaryColor = Color(0xFF00438A);

  @override
  Color secondaryColor = Color(0xFFB5B7BA);

  @override
  Color onSurfaceColor = Color(0xFF00438A);
}

class _DarkThemePalette extends _ThemePalette {
  @override
  Color primaryColor = Color(0xFFB8C9EA);

  @override
  Color secondaryColor = Color(0xFFB5B7BA);

  @override
  Color onSurfaceColor = Color(0xFF00438A);
}
