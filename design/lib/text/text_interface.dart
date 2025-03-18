library;

import 'package:flutter/material.dart';

part 'text_micro.dart';

part 'text_min.dart';

part 'text.dart';

part 'text_max.dart';

part 'text_thumb.dart';

part 'text_ultra.dart';

abstract class _TextInterface extends StatelessWidget {
  const _TextInterface(this.data,
      {super.key,
      required this.color,
      required this.overFlowFade,
      required this.height,
      required this.textAlign,
      required this.defaultScale,
      required this.decoration,
      required this.fontWeight,
      required this.maxLines,
      required this.softWrap});

  final String? data;
  final Color? color;
  final bool? overFlowFade;
  final double? height;
  final TextAlign? textAlign;
  final bool? defaultScale;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final int? maxLines;
  final bool? softWrap;

  double Function(BuildContext) get fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? '',
      textAlign: textAlign,
      textScaler: (defaultScale == true) ? TextScaler.noScaling : null,
      style: TextStyle(
          decoration: decoration,
          fontSize: fontSize(context),
          height: height,
          fontWeight: fontWeight,
          color: color ?? Colors.black),
      overflow: overFlowFade ?? false
              ? TextOverflow.ellipsis
              : null,
      maxLines: maxLines ?? (overFlowFade ?? false ? 1 : null),
      softWrap: softWrap ?? overFlowFade ?? false ? false : null,
    );
  }

  double _getFontSize(BuildContext context, double ratio, double fixedSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    // if (screenWidth >= 460) return fixedSize;
    return fixedSize; // screenWidth * ratio;
  }
}
