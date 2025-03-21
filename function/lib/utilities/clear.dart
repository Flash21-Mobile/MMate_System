import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/utilities/imagebuilder/image_builder_provider.dart';

class MMateClear {
  static Future image(WidgetRef ref) async {
    ref.invalidate(imageBuilderProvider);
  }
}
