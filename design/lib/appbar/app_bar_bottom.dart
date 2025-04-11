import 'dart:ui';

import 'package:flutter/material.dart';

class MMateAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final double height;
  final Widget child;

  const MMateAppBarBottom(
    this.context, {
    super.key,
    required this.height,
    required this.child,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: child,
    );
  }
}
