import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_avif/flutter_avif.dart';

class IndexImage extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Alignment alignment;

  final Uint8List imageData;
  final Widget imageWidget;

  const IndexImage._({
    super.key,
    required this.imageData,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
    required this.imageWidget,
  });

  factory IndexImage.memory(Uint8List? imageData,
      {Key? key,
      double? width,
      double? height,
      BoxFit? fit,
      Alignment alignment = Alignment.center,
      Widget? errorWidget}) {
    if (imageData == null || imageData.isEmpty) {
      return IndexImage._(
        key: key,
        imageData: Uint8List(0),
        width: width,
        height: height,
        fit: fit,
        imageWidget: errorWidget ??
            SizedBox(
              width: width,
              height: height,
              child: Placeholder(),
            ),
        alignment: alignment,
      );
    }
    final imageWidget = AvifImage.memory(
      imageData,
      key: key,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      errorBuilder: (_, __, ___) {
        return Image.memory(
            key: key,
            imageData,
            width: width,
            height: height,
            fit: fit,
            alignment: alignment);
      },
    );
    return IndexImage._(
      key: key,
      imageData: imageData,
      width: width,
      height: height,
      fit: fit,
      imageWidget: imageWidget,
      alignment: alignment,
    );
  }

  @override
  Widget build(BuildContext context) {
    return imageWidget;
  }
}
