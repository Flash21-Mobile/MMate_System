part of '_app_theme_data.dart';

class _ThemePalette {
  static const primaryColor = Color(0xFF1979E4);
  static const secondaryColor = Color(0xFFD7EAFF);

  static Color _desaturate(Color color) {
    final hsl = HSLColor.fromColor(color);
    final adjustedHsl = hsl
        .withSaturation((hsl.saturation * 0.9).clamp(0.0, 1.0))
        .withLightness((hsl.lightness * 1.15).clamp(0.0, 1.0));
    return adjustedHsl.toColor();
  }
}