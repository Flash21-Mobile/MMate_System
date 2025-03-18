import 'package:design_system/text/text_interface.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget {
  static Widget sizedBox(
      {double? width,
      double? height,
      BorderRadius? borderRadius,
      Widget? child,
      List<Color>? colors,
      bool enabled = true}) {
    return SizedBox(
        width: width,
        height: height,
        child: enabled
            ? Shimmer.fromColors(
                baseColor: colors != null && colors.length > 1
                    ? colors.first
                    : Colors.grey.shade300,
                highlightColor: colors != null && colors.length > 1
                    ? colors.last
                    : Colors.grey.shade100,
                child: IgnorePointer(
                    ignoring: true,
                    child: child ??
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  borderRadius ?? BorderRadius.circular(5),
                              color: Colors.black),
                        )))
            : child);
  }

  static Widget indexTextMax({
    String text = '로딩텍스트',
    BorderRadius? borderRadius,
    List<Color>? colors,
  }) {
    return Shimmer.fromColors(
        baseColor: colors != null && colors.length > 1
            ? colors.first
            : Colors.grey.shade300,
        highlightColor: colors != null && colors.length > 1
            ? colors.last
            : Colors.grey.shade100,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: borderRadius ?? BorderRadius.circular(5),
            ),
            child: IndexTextMax(text)));
  }

  static Widget indexTextThumb({
    String text = '로딩텍스트',
    BorderRadius? borderRadius,
    List<Color>? colors,
  }) {
    return Shimmer.fromColors(
        baseColor: colors != null && colors.length > 1
            ? colors.first
            : Colors.grey.shade300,
        highlightColor: colors != null && colors.length > 1
            ? colors.last
            : Colors.grey.shade100,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: borderRadius ?? BorderRadius.circular(5),
            ),
            child: IndexTextThumb(text)));
  }

  static Widget indexText({
    String text = '로딩텍스트',
    BorderRadius? borderRadius,
    List<Color>? colors,
  }) {
    return Shimmer.fromColors(
        baseColor: colors != null && colors.length > 1
            ? colors.first
            : Colors.grey.shade300,
        highlightColor: colors != null && colors.length > 1
            ? colors.last
            : Colors.grey.shade100,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: borderRadius ?? BorderRadius.circular(5),
            ),
            child: IndexText(text)));
  }

  static Widget indexTextMin({
    String text = '로딩텍스트',
    BorderRadius? borderRadius,
    List<Color>? colors,
  }) {
    return Shimmer.fromColors(
        baseColor: colors != null && colors.length > 1
            ? colors.first
            : Colors.grey.shade300,
        highlightColor: colors != null && colors.length > 1
            ? colors.last
            : Colors.grey.shade100,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: borderRadius ?? BorderRadius.circular(5),
            ),
            child: IndexTextMin(text)));
  }

  static Widget indexTextUltra({
    String text = '로딩텍스트',
    BorderRadius? borderRadius,
    List<Color>? colors,
  }) {
    return Shimmer.fromColors(
        baseColor: colors != null && colors.length > 1
            ? colors.first
            : Colors.grey.shade300,
        highlightColor: colors != null && colors.length > 1
            ? colors.last
            : Colors.grey.shade100,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: borderRadius ?? BorderRadius.circular(5),
            ),
            child: IndexTextUltra(text)));
  }
}
