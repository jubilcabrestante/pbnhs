import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/user_auth/user_auth_model.dart';

part 'user_auth_state.freezed.dart';

@freezed
class UserAuthState with _$UserAuthState {
  const factory UserAuthState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorMessage,
    UserAuthModel? userAuthModel, // ✅ Add this field
  }) = _UserAuthState;
}
