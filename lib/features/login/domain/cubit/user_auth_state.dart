import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/models/user_auth/user_auth_model.dart';

part 'user_auth_state.freezed.dart';

@freezed
class UserAuthState with _$UserAuthState {
  const factory UserAuthState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(true) bool isNewUser,
    String? errorMessage,
    UserAuthModel? userAuthModel,
  }) = _UserAuthState;
}
