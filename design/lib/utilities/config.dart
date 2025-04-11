import 'package:flutter/cupertino.dart';

class IndexPadding extends EdgeInsets {
  const IndexPadding({
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) : super.only(
          left: left ?? horizontal ?? all ?? 0,
          right: right ?? horizontal ?? all ?? 0,
          top: top ?? vertical ?? all ?? 0,
          bottom: bottom ?? vertical ?? all ?? 0,
        );
}
