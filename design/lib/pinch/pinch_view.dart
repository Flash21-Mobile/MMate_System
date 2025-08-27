import 'package:flutter/cupertino.dart';

class PinchView extends StatelessWidget {
  final Widget child;

  const PinchView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(minScale: 1.0, maxScale: 6.0, child: child);
  }
}