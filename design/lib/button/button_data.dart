import 'package:design_system/config.dart';
import 'package:flutter/cupertino.dart';

import 'button_status.dart';

class MMateButtonData {
  final String data;
  final Function()? onTap;
  final dynamic svgIcon;
  final MMateButtonStatus status;
  final EdgeInsets padding;

  MMateButtonData({
    required this.data,
    required this.onTap,
    this.svgIcon,
    this.status = MMateButtonStatus.enable,

    EdgeInsets? padding,
  }) : padding = padding ?? AppConfig.padding / 3 * 2;
}
