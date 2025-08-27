import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'image_builder_keys_provider.dart';
import 'image_builder_provider.dart';

extension ImageBuilderRefExtensions on WidgetRef {
  void clearAllImages() {
    final usedKeys = read(imageBuilderKeysProvider);
    for (final key in usedKeys) {
      invalidate(imageBuilderProvider(key));
    }

    read(imageBuilderKeysProvider.notifier).state = {};
  }
}