import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pbnhs/core/domain/i_user_auth_repo.dart';
import 'package:pbnhs/features/accounts/repository/user_model/user_model.dart';

part 'user_auth_state.dart';
part 'user_auth_cubit.freezed.dart';

class UserAuthCubit extends Cubit<UserAuthState> {
  final IUserAuthRepository _userAuthRepository;
  UserAuthCubit(this._userAuthRepository) : super(UserAuthState());

  signIn(String email, String password) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      final user =
          await _userAuthRepository.signInWithEmailAndPassword(email, password);
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        isAuthenticated: true,
        user: user,
        isNewUser: user.isNewUser,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  logOut() async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      await _userAuthRepository.logOut();
      emit(state.copyWith(
        isLoading: false,
        isAuthenticated: false,
        user: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  changePassword(String newPassword) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      await _userAuthRepository.updatePassword(newPassword);
      emit(state.copyWith(
        isLoading: false,
        isNewUser: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }
}
