import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrollablePinchView extends StatefulWidget {
  final Widget child;
  final EdgeInsets? padding;

  const ScrollablePinchView({super.key, required this.child, this.padding});

  @override
  State<ScrollablePinchView> createState() => _ScrollablePinchView();
}

class _ScrollablePinchView extends State<ScrollablePinchView> {
  final List<int> events = [];
  bool _isPinch = false;

  @override
  Widget build(BuildContext context) {
    final currentPadding = MediaQuery.of(context).padding;
    return Builder(
        builder: (context) => Listener(
            onPointerDown: (PointerEvent event) {
              events.add(event.pointer);
              final int pointers = events.length;

              if (pointers >= 2) {
                setState(() => _isPinch = true);
              }
            },
            onPointerUp: (event) {
              events.clear();
              setState(() => _isPinch = false);
            },
            child: SingleChildScrollView(
              padding: widget.padding?? currentPadding,
                physics:
                    _isPinch ? NeverScrollableScrollPhysics() : ScrollPhysics(),
                child: InteractiveViewer(
                    minScale: 1.0, maxScale: 6.0, child: widget.child))));
  }
}
