import 'dart:typed_data';

class ImageBuilderState {
  final Uint8List? data;
  final bool isEmpty;
  final bool isLoading;
  final String? error;
  final bool isInit;

  ImageBuilderState({
    this.data,
    required this.isEmpty,
    required this.isLoading,
    this.error,
    required this.isInit
  });

  factory ImageBuilderState.initial() {
    return ImageBuilderState(
        data: null,
        isEmpty: false,
        isLoading: false,
        error: null,
        isInit: false
    );
  }

  ImageBuilderState copyWith({
    Uint8List? data,
    bool? isEmpty,
    bool? isLoading,
    String? error,
    bool? isInit
  }) {
    return ImageBuilderState(
        data: data ?? this.data,
        isEmpty: isEmpty ?? this.isEmpty,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        isInit: isInit??this.isInit
    );
  }
}
