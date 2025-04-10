import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MMateListener extends HookWidget {
  const MMateListener({
    super.key,
    required this.child,
    this.backgroundColor,
    this.scaleDown = true,
    this.scaleDiff = 0.05,
    this.borderRadius,
  });

  final Widget child;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  /// Whether to scale down or up on tap
  final bool scaleDown;

  /// The difference in scale
  final double scaleDiff;

  @override
  Widget build(BuildContext context) {
    final animate = useState(false);

    return Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: borderRadius,
        ),
        child: AnimatedScale(
          scale: animate.value ? 1 + scaleDiff * (scaleDown ? -1 : 1) : 1,
          duration: const Duration(milliseconds: 100), // 애니메이션 시간 0.5초
          curve: Curves.easeInOut,
          child: Material(
              borderRadius: borderRadius,
              color:  backgroundColor ?? Colors.transparent,
              child: Listener(
                onPointerDown: (details) {
                  animate.value = true;
                },
                onPointerCancel: (_) {
                  animate.value = false;
                },
                onPointerUp: (details) {
                  // Short taps still show animation for at least 0.5s
                  Future.delayed(const Duration(milliseconds: 100), () {
                    animate.value = false;
                  });
                },
                child: child,
              )),
        ));
  }
}
