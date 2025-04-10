import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DrawingCanvas extends StatefulWidget {
  final Color color;
  final double strokeWidth;
  final DrawingCanvasController? controller;

  const DrawingCanvas({
    super.key,
    this.color = Colors.black,
    this.strokeWidth = 4.0,
    this.controller,
  });

  @override
  State<DrawingCanvas> createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  List<Offset?> _points = [];

  @override
  void initState() {
    super.initState();
    widget.controller?._attach(this);
  }

  void _clear() {
    setState(() {
      _points.clear();
    });
    widget.controller?._notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(child:  GestureDetector(
      onPanUpdate: (details) {
        RenderBox box = context.findRenderObject() as RenderBox;
        Offset point = box.globalToLocal(details.globalPosition);
        setState(() {
          _points.add(point);
        });
        widget.controller?._notifyListeners();
      },
      onPanEnd: (_) {
        setState(() => _points.add(null));
        widget.controller?._notifyListeners();
      },
      child: CustomPaint(
        painter: _DrawingPainter(_points, widget.color, widget.strokeWidth),
        size: Size.infinite,
      ),
    ),);
  }
}

class _DrawingPainter extends CustomPainter {
  final List<Offset?> points;
  final Color color;
  final double strokeWidth;

  _DrawingPainter(this.points, this.color, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DrawingPainter oldDelegate) => true;
}

class DrawingCanvasController {
  _DrawingCanvasState? _state;
  final List<VoidCallback> _listeners = [];

  void _attach(_DrawingCanvasState state) {
    _state = state;
  }

  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  void _notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }

  void clear() {
    _state?._clear();
  }

  bool get hasDrawing => _state?._points.isNotEmpty == true;
}

DrawingCanvasController useDrawingCanvasController() {
  return useMemoized(() => DrawingCanvasController());
}