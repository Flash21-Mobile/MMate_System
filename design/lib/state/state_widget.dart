import 'package:flutter/material.dart';

import '../loading/loading_widget.dart';

class StateWidget extends StatelessWidget {
  final bool isLoading;
  final bool isError;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget child;

  final double? width;
  final double? height;

  const StateWidget({
    super.key,
    required this.isLoading,
    required this.isError,
    this.loadingWidget,
    this.errorWidget,
    required this.child,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return loadingWidget ??
          LoadingWidget.sizedBox(
            width: width,
            height: height,
          );
    }
    if (isError) {
      return errorWidget ?? SizedBox(width: width,height: height);
    }

    return SizedBox(
      width: width,
      height: height,
      child: child,
    );
  }
}
