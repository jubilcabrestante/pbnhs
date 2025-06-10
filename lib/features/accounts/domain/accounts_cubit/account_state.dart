import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pbnhs/features/accounts/repository/account_model/account_vm.dart';
part 'account_state.freezed.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    String? errorMessage,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isRole,
    List<AccountVm>? users,
    User? currentUser,
  }) = _AccountState;
}
