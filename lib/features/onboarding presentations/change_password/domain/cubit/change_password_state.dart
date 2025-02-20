part of 'change_password_cubit.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _ChangePasswordState;
}
