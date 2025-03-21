import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:function_system/utilities/imagebuilder/image_builder_key.dart';
import 'package:function_system/utilities/imagebuilder/image_builder_provider.dart';

class MMateImageBuilder extends ConsumerWidget {
  final Widget? loadingWidget;
  final Widget Function(Uint8List? bytes) builder;

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

    return builder(imageState.data);
  }
}
