part of 'app_style.dart';

class _AppPadding {
  EdgeInsets padding(
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? right,
    double? top,
    double? bottom,
  ) {
    final currentLeft = left ?? horizontal ?? all ?? 0;
    final currentRight = right ?? horizontal ?? all ?? 0;
    final currentTop = top ?? vertical ?? all ?? 0;
    final currentBottom = bottom ?? vertical ?? all ?? 0;

    return EdgeInsets.only(
      left: currentLeft,
      right: currentRight,
      top: currentTop,
      bottom: currentBottom,
    );
  }
}
