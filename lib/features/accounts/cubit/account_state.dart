import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_state.freezed.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    String? errorMessage,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isRole,
  }) = _AccountState;
}
