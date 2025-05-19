import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StateBuilder<T> extends HookWidget {
  final bool isLoading;
  final String? error;
  final T? data;
  final Widget Function(BuildContext context, T data) builder;
  final Widget Function(BuildContext context, String error)? errorBuilder;
  final Widget? loadingWidget;

  const StateBuilder({
    super.key,
    required this.isLoading,
    required this.error,
    required this.data,
    required this.builder,
    this.errorBuilder,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    final showLoading = useState(false);

    useEffect(() {
      bool isCancelled = false;

      if (isLoading) {
        Future.delayed(const Duration(milliseconds: 400), () {
          if (!isCancelled && isLoading) {
            showLoading.value = true;
          }
        });
      } else {
        showLoading.value = false;
      }

      return () {
        isCancelled = true; // 이전 delayed 무효화
      };
    }, [isLoading]);

    if (isLoading) {
      if (showLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      return SizedBox();
    }

    if (error != null) {
      return errorBuilder?.call(context, error!) ?? const SizedBox.shrink();
    }

    try {
      return builder(context, data as T);
    } on TypeError catch (e) {
      if (e.toString().contains('type \'Null\' is not a subtype of type')) {
        if (kDebugMode) {
          debugPrint('[Null 가능성]');
        }
        return const SizedBox.shrink();
      } else {
        rethrow;
      }
    }
  }
}
