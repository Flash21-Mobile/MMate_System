import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:function_system/utilities/imagebuilder/image_builder_key.dart';
import 'package:function_system/utilities/imagebuilder/image_builder_provider.dart';

class MMateImageBuilder extends ConsumerWidget {
  final Widget? loadingWidget;
  final Widget Function(Widget? imageWidget) builder;

  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;

  final int id;
  final String api;
  final bool showFirstImage;

  const MMateImageBuilder(
    this.id,
    this.api, {
    super.key,
    this.loadingWidget,
    required this.builder,
    this.showFirstImage = false,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageState = ref.watch(imageBuilderProvider(ImageBuilderKey(
      id,
      api,
      !showFirstImage,
    )));

    if (imageState.isLoading || imageState.isInit == false) {
      return loadingWidget ?? SizedBox();
    }

    Widget? imageWidget;

    if (imageState.data != null) {
      imageWidget = Image.memory(
        imageState.data!,
        width: width,
        height: height,
        alignment: alignment,
        fit: fit,
      );
    }
    return builder(imageWidget);
  }
}
