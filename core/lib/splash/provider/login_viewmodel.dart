import 'dart:io';

import 'package:core_system/splash/state/login_state.dart';
import 'package:function_system/di/login/login_use_case_provider.dart';
import 'package:function_system/di/sign/sign_use_case_provider.dart';
import 'package:function_system/utilities/exception/exceoption.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class LoginViewmodel extends _$LoginViewmodel {
  @override
  LoginState build() {
    return LoginState().copyWith(isLoading: true);
  }

  Future _fetch() async {
    state = state.copyWith(isLoading: true);
    try {
      final getCellphoneUseCase = ref.watch(getCellphoneUseCaseProvider);

      var cellphone = await getCellphoneUseCase.execute();

      if (cellphone == null && Platform.isAndroid) {
        final getCellphoneInAndroidUseCase =
            ref.watch(getCellphoneInAndroidUseCaseProvider);

        cellphone = await getCellphoneInAndroidUseCase.execute();
      }

      if (cellphone == null) {
        state = state.copyWith(isLoading: false, data: null);
        return;
      }

      final signInUseCase = ref.watch(signInUseCaseProvider);
      await signInUseCase.execute(null, cellphone: cellphone);

      final loginUseCase = ref.watch(loginUseCaseProvider);
      final myAccount =await loginUseCase.execute();

      state = state.copyWith(isLoading: false, data: myAccount);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future fetchData() async => _fetch();

  Future refreshData() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final getCellphoneUseCase = ref.watch(getCellphoneUseCaseProvider);
      final cellphone = await getCellphoneUseCase.execute();

      if (cellphone != null) {
        final loginUseCase = ref.watch(loginUseCaseProvider);

        final myAccount = await loginUseCase.execute();

        state = state.copyWith(isLoading: false, data: myAccount);
      }
      state = state.copyWith(isLoading: false, error: MMateException.noData);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
