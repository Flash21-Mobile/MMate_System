library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'app_system_style.dart';

part 'app_padding.dart';

part 'app_radius.dart';

part 'app_style_converter.dart';

final sp5 = 5.0;
final sp16 = 16.0;
final sp24 = 24.0;

class AppStyle {
  static SystemUiOverlayStyle systemStyle(BuildContext context) =>
      _AppSystemStyle().systemStyle(context);

  static EdgeInsets padding({
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) => _AppPadding().padding(
    all,
    horizontal,
    vertical,
    left,
    right,
    top,
    bottom,
  );

  static BorderRadius borderRadius({
    double? all,
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) => _AppRadius().radius(
    all,
    top,
    bottom,
    left,
    right,
    topLeft,
    topRight,
    bottomLeft,
    bottomRight,
  );
}
