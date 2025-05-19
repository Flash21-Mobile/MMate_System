import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class StateBuilder<T> extends StatelessWidget {
  final bool isLoading;
  final String? error;
  final T? data;
  final Widget Function(BuildContext context, T) builder;
  final Widget Function(BuildContext context, String error)? errorBuilder;

  const StateBuilder({
    super.key,
    required this.isLoading,
    required this.error,
    required this.data,
    required this.builder,
    this.errorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final loadingWidget = SizedBox();
    if (isLoading) {
      return loadingWidget;
    }
    if (error != null) {
      return errorBuilder?.call(context, error!) ?? loadingWidget;
    }
    try {
      return builder(context, data as T);
    } on TypeError catch (e) {
      if (e.toString().contains('type \'Null\' is not a subtype of type')) {
        if (kDebugMode){
          debugPrint('[Null 가능성]');
        }
        return loadingWidget;
      } else {
        rethrow;
      }
    }
  }
}
