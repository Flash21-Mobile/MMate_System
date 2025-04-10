import 'dart:io';
import 'dart:typed_data';

import 'package:design_system/image/image_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class MMateImage extends ConsumerWidget {
  final Object data;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;
  final bool enableToDetail;
  final String? heroTag;
  final Color? color;

  const MMateImage(
    this.data, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.enableToDetail = false,
    this.heroTag,
    this.color,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageAssets = ['.png', '.jpg', 'jpeg'];
    final svgAssets = ['.svg'];
    final imageNetwork = ['https://', 'http://'];

    Widget currentWidget = SizedBox();

    if (enableToDetail && heroTag == null) {
      throw 'Hero Tag를 추가해야 합니다';
    }

    if (data is String) {
      final imageData = data as String;

      if (imageAssets.any((e) => imageData.contains(e))) {
        currentWidget = Image.asset(
          imageData,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
        );
      } else if (svgAssets.any((e) => imageData.contains(e))) {
        currentWidget = SvgPicture.asset(
          imageData,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        );
      } else if (imageNetwork.any((e) => imageData.contains((e)))) {
        currentWidget = Image.network(
          imageData,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
        );
      } else {
        throw '${data} 지원하지 않는 형식의 문자열 입니다';
      }
    } else if (data is File) {
      final imageData = data as File;
      currentWidget = Image.file(
        imageData,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
      );
    } else if (data is Uint8List) {
      final imageData = data as Uint8List;
      currentWidget = Image.memory(
        imageData,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
      );
    } else if (data is Future<File?>) {
      currentWidget = FutureBuilder(
          future: data as Future<File?>,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(width: width, height: height);
            } else if (snapshot.hasError) {
              return SizedBox(
                width: width,
                height: height,
              );
            } else if (snapshot.hasData) {
              return Image.file(
                snapshot.data!,
                width: width,
                height: height,
                fit: fit,
                alignment: alignment,
              );
            } else {
              return SizedBox(
                width: width,
                height: height,
              );
            }
          });
    } else {
      throw '지원하지 않는 형식의 데이터 입니다';
    }

    return InkWell(
        onTap: enableToDetail
            ? () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => ImageDetail(data, heroTag!)));
              }
            : null,
        child: enableToDetail
            ? Hero(
                tag: heroTag!,
                child: currentWidget,
              )
            : currentWidget);
  }
}
