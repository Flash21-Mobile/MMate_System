part of 'app_style.dart';

extension AppStyleConverter on double {
  EdgeInsets toPadding() {
    return EdgeInsets.all(this);
  }

  BorderRadius toBorderRadius() {
    return BorderRadius.circular(this);
  }
}