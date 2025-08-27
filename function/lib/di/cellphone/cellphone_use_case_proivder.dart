import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/cellphone/use_case/get_cellphone_use_case.dart';
import '../../domain/cellphone/use_case/set_cellphone_use_case.dart';
import '../sign/sign_repository_provider.dart';

final getCellphoneUseCaseProvider = Provider<GetCellphoneUseCase>((ref){
  final repository = ref.watch(signRepositoryProvider);

  return GetCellphoneUseCase(repository);
});

final setCellphoneUseCaseProvider = Provider<SetCellphoneUseCase>((ref){
  final repository = ref.watch(signRepositoryProvider);
  return SetCellphoneUseCase(repository);
});