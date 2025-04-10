import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/sign/sign_repository_provider.dart';
import 'package:function_system/domain/utilites/usecase/get_my_cellphone_use_case.dart';

final getMyCellphoneProvider = Provider<GetMyCellphoneUseCase>((ref) {
  final repository = ref.watch(signRepositoryProvider);
  return GetMyCellphoneUseCase(repository);
});


