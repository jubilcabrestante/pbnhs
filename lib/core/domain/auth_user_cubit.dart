import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/domain/auth_user_state.dart';
import 'package:pbnhs/core/repository/user_auth_repo.dart';

class AuthCubit extends Cubit<AuthUserState> {
  final UserAuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(const AuthUserState());

  Future<void> signIn(String email, String password) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await _authRepository.signIn(email, password);
      emit(state.copyWith(isSuccess: true, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> logOut() async {
    emit(state.copyWith(isLogoutLoading: true));
    try {
      await _authRepository.logOut();
      emit(state.copyWith(isLogoutSuccess: true, isLogoutLoading: false));
    } catch (e) {
      emit(state.copyWith(isLogoutLoading: false, errorMessage: e.toString()));
    }
  }
}
