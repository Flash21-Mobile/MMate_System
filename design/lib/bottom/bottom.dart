import 'package:flutter/material.dart';

class MMateBottom extends StatelessWidget {
  final Color? backgroundColor;

  const MMateBottom({super.key, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ClipPath(
                clipper: InvertedTopRightClipper(),
                child: Container(
                  height: 24,
                  width: 24,
                  color: backgroundColor
                ),
              ),
              Spacer(),
              ClipPath(
                clipper: InvertedTopLeftClipper(),
                child: Container(
                  height: 24,
                  width: 24,
                  color: backgroundColor
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(color: backgroundColor),
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      );
    });
  }
}

class InvertedTopRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // 시작: 왼쪽 위
    path.moveTo(0, 0);

    // 오른쪽 위로 가기 전에 위쪽 라인 그리다가 곡선으로 오목하게 잘림
    path.lineTo(size.width - size.width, 0); // 위쪽 라인 시작
    path.arcToPoint(
      Offset(size.width, size.height),
      radius: Radius.elliptical(size.width, size.height),
      clockwise: false,
    );

    // 오른쪽 아래로
    path.lineTo(size.width, size.height);

    // 왼쪽 아래로
    path.lineTo(0, size.height);

    // 닫기
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class InvertedTopLeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // 시작점: 왼쪽 위 잘린 곡선 시작점 (0, height)
    path.moveTo(0, size.height);

    // 오목하게 잘린 부분 그리기 (왼쪽 위 → 오른쪽 아래 방향으로)
    path.arcToPoint(
      Offset(size.width, 0),
      radius: Radius.elliptical(size.width, size.height),
      clockwise: false,
    );

    // 오른쪽 아래
    path.lineTo(size.width, size.height);

    // 왼쪽 아래
    path.lineTo(0, size.height);

    // 닫기
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
