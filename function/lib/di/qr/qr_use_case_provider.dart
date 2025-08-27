import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/qr/qr_repository_provider.dart';
import 'package:function_system/domain/qr/use_case/qr_use_case.dart';

final qrUseCaseProvider = Provider<QrUseCase>((ref) {
  final repository = ref.watch(qrRepositoryProvider);
  return QrUseCase(repository);
});
