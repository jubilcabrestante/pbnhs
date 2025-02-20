import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pbnhs/core/repository/user_repository.dart';

part 'change_password_state.dart';
part 'change_password_cubit.freezed.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final UserAuthRepository _userAuthRepository;

  ChangePasswordCubit(this._userAuthRepository)
      : super(const ChangePasswordState());

  Future<void> changePassword(String newPassword) async {
    emit(state.copyWith(isLoading: true, isSuccess: false, errorMessage: null));

    try {
      await _userAuthRepository.updatePassword(newPassword);

      // Get current user ID
      final userId = await _userAuthRepository.getCurrentUserId();
      if (userId != null) {
        await _userAuthRepository.updateUserField(userId, {'isNewUser': false});
      }

      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
