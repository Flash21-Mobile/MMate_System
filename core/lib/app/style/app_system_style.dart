part of 'app_style.dart';

class _AppSystemStyle {
  SystemUiOverlayStyle systemStyle(BuildContext context) {
    final isLightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;

    return SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness:
      isLightMode ? Brightness.dark : Brightness.light,
      systemNavigationBarContrastEnforced: false,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isLightMode ? Brightness.dark : Brightness.light,
    );
  }
}