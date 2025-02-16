import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_state.freezed.dart';

@freezed
class AuthUserState with _$AuthUserState {
  const factory AuthUserState({
    String? errorMessage,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isLogoutSuccess,
    @Default(false) bool isOnCheckUser,
    @Default(false) bool isLogoutLoading,
    @Default(false) bool isConnected,
  }) = _AuthUserState;
}
