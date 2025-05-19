part of 'app_style.dart';

class _AppRadius {
  BorderRadius radius(
    double? all,
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  ) {
    final currentTopLeft = topLeft ?? top ?? left ?? all ?? 0;
    final currentTopRight = topRight ?? top ?? right ?? all ?? 0;
    final currentBottomLeft = bottomLeft ?? bottom ?? left ?? all ?? 0;
    final currentBottomRight = bottomRight ?? bottom ?? right ?? all ?? 0;

    return BorderRadius.only(
      topLeft: Radius.circular(currentTopLeft),
      topRight: Radius.circular(currentTopRight),
      bottomLeft: Radius.circular(currentBottomLeft),
      bottomRight: Radius.circular(currentBottomRight),
    );
  }
}
