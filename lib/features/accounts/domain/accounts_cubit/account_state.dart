import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pbnhs/core/models/user_model/user_model.dart'; // Import UserModel

part 'account_state.freezed.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    String? errorMessage,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isRole,
    List<UserModel>? users, // Add this to store the list of users
  }) = _AccountState;
}
