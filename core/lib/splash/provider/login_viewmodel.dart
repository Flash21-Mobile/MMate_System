import 'package:function_system/di/login/login_use_case_provider.dart';
import 'package:function_system/di/sign/sign_use_case_provider.dart';
import 'package:function_system/domain/account/entity/account/account.dart';
import 'package:function_system/domain/cellphone/use_case/get_cellphone_use_case.dart';
import 'package:function_system/domain/cellphone/use_case/set_cellphone_use_case.dart';
import 'package:function_system/domain/login/use_case/login_use_case.dart';
import 'package:function_system/domain/sign/sign_in_use_case.dart';
import 'package:function_system/utilities/exception/exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:function_system/di/cellphone/cellphone_use_case_proivder.dart';

part 'login_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class LoginViewmodel extends _$LoginViewmodel {
  late GetCellphoneUseCase _getCellphoneUseCase;
  late SetCellphoneUseCase _setCellphoneUseCase;

  late SignInUseCase _signInUseCase;

  late LoginUseCase _loginUseCase;

  @override
  Future<Account> build() async {
    _getCellphoneUseCase = ref.watch(getCellphoneUseCaseProvider);
    _setCellphoneUseCase = ref.watch(setCellphoneUseCaseProvider);

    _signInUseCase = ref.watch(signInUseCaseProvider);
    _loginUseCase = ref.watch(loginUseCaseProvider);

    return await _fetch();
  }

  Future<Account> _fetch() async {
    final cellphone = await _getCellphoneUseCase.execute();

    if (cellphone == null) {
      throw MMateException.noCellphone;
    }

    await _signInUseCase.execute(null, cellphone: cellphone);

    return await _loginUseCase.execute();
  }

  Future<void> login(String cellphone) async {
    state = const AsyncValue.loading();

    final result = await AsyncValue.guard(() async {
      await _setCellphoneUseCase.execute(cellphone);
      return await _fetch();
    });

    state = result;
  }
}
