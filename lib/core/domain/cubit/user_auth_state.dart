part of 'user_auth_cubit.dart';

@freezed
class UserAuthState with _$UserAuthState {
  factory UserAuthState(
      {@Default(false) bool isSuccess,
      @Default(false) bool isLoading,
      @Default(false) bool isAuthenticated,
      @Default(false) bool isNewUser,
      String? errorMessage,
      UserVm? user}) = _Initial;
}
