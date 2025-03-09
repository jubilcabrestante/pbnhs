import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pbnhs/features/accounts/repository/user_model/user_model.dart';

part 'account_state.freezed.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    String? errorMessage,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isRole,
    List<UserModel>? users,
    UserModel? currentUser,
  }) = _AccountState;
}
