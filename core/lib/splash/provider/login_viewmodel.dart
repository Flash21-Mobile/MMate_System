import 'package:core_system/splash/state/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/sign/sign_use_case_provider.dart';
import 'package:function_system/di/utilities/base_url_provider.dart';
import 'package:function_system/di/utilities/cellphone_provider.dart';
import 'package:function_system/domain/account/account_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class LoginViewmodel extends _$LoginViewmodel {
  @override
  LoginState build() {
    ref.listen(cellphoneProvider, (previous, next) {
      _fetch();
    });
    return LoginState();
  }

  Future _fetch({String? name}) async {
    final cellphone = ref.watch(cellphoneProvider);
    if (cellphone != null) {
      final signInUseCase = ref.watch(signInUseCaseProvider);
      state = state.copyWith(isLoading: true, error: null);

      try {
        final result = await signInUseCase.execute(
          null,
          name: name,
          cellphone: cellphone,
        );

        state = state.copyWith(isLoading: false, data: result);
      } catch (e) {
        state = state.copyWith(isLoading: false, error: e.toString());
      }
    }
  }

  Future fetchData() async => _fetch();
}
