import 'dart:ui';

import 'package:flutter/cupertino.dart';

class GradientBorderPainter extends CustomPainter {
  final double borderWidth;
  final List<Color> colors;
  final Radius borderRadius;

  GradientBorderPainter({
    required this.borderWidth,
    required this.colors,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 테두리가 바깥으로 넘어가지 않도록 rect 크기를 줄여줌
    final Rect rect = Rect.fromLTWH(
      borderWidth / 2, // 테두리 크기만큼 이동
      borderWidth / 2, // 테두리 크기만큼 이동
      size.width - borderWidth, // 테두리 크기만큼 축소
      size.height - borderWidth, // 테두리 크기만큼 축소
    );

    final Paint paint = Paint()
      ..shader = LinearGradient(colors: colors).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final RRect rrect = RRect.fromRectAndRadius(rect, borderRadius); // 동일한 borderRadius 적용
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}