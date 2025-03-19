import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class MMateImage extends ConsumerWidget {
  final Object data;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;

  const MMateImage(
    this.data, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageAssets = ['.png', '.jpg', 'jpeg'];
    final svgAssets = ['.svg'];
    final imageNetwork = ['https://', 'http://'];

    if (data is String) {
      final imageData = data as String;

      if (imageAssets.any((e) => imageData.contains(e))) {
        return Image.asset(
          imageData,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
        );
      }
      if (svgAssets.any((e) => imageData.contains(e))) {
        return SvgPicture.asset(
          imageData,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
        );
      }
      if (imageNetwork.any((e) => imageData.contains((e)))) {
        return Image.network(
          imageData,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
        );
      }
      throw '지원하지 않는 형식의 문자열 입니다';
    } else if (data is File) {
      final imageData = data as File;
      return Image.file(
        imageData,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
      );
    } else if (data is Uint8List) {
      final imageData = data as Uint8List;
      return Image.memory(
        imageData,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
      );
    }
    throw '지원하지 않는 형식의 문자열 입니다';
  }
}
