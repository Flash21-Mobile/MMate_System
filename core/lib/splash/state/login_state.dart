import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:function_system/domain/account/entity/account/account_entity.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(true) isLoading,
    @Default(null) String? error,
    @Default(false) bool isLogin,
    @Default(null) AccountEntity? data,
  }) = _LoginState;
}
