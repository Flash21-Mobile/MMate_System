import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ScrollablePinchView extends StatefulWidget {
  final List<Uint8List> images;
  final double? width;
  final double? height;

  const ScrollablePinchView({
    super.key,
    required this.images,
    this.width,
    this.height,
  });

  @override
  State<ScrollablePinchView> createState() => _ScrollablePinchViewState();
}

class _ScrollablePinchViewState extends State<ScrollablePinchView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    final imageTags =
    widget.images.map((bytes) {
      final base64Image = base64Encode(bytes);
      return '''
        <div style="margin-bottom: 12px;">
          <img src="data:image/png;base64,$base64Image" style="width: 100%; height: auto; display: block;" />
        </div>
      ''';
    }).join();

    final htmlContent = '''
      <!DOCTYPE html>
      <html>
        <head>
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <style>
            html, body {
              margin: 0;
              padding: 0;
            }
            img {
              max-width: 100%;
              height: auto;
            }
          </style>
        </head>
        <body>
          $imageTags
        </body>
      </html>
    ''';

    _controller =
    WebViewController()
      ..loadHtmlString(htmlContent);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width, // 여기서 너비 조절 가능!
      height: widget.height,
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: WebViewWidget(controller: _controller),
    );
  }
}
