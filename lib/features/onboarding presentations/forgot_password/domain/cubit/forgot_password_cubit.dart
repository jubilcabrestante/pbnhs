import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pbnhs/core/repository/user_repository.dart';

part 'forgot_password_state.dart';
part 'forgot_password_cubit.freezed.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final UserAuthRepository _userAuthRepository;

  ForgotPasswordCubit(this._userAuthRepository)
      : super(const ForgotPasswordState());

  Future<void> resetPassword(String email) async {
    emit(state.copyWith(isLoading: true, isSuccess: false, errorMessage: null));

    try {
      await _userAuthRepository.resetPassword(email);
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
