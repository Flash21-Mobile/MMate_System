import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:function_system/domain/account/account_entity.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState ({
    @Default(true) isLoading,
    @Default(null) String? error,
    @Default(null) AccountEntity? data
  }) = _LoginState;
}