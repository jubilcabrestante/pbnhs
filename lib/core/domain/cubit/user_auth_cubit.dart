import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pbnhs/core/domain/i_user_auth_repo.dart';
import 'package:pbnhs/features/accounts/repository/user_model/user_model.dart';

part 'user_auth_state.dart';
part 'user_auth_cubit.freezed.dart';

class UserAuthCubit extends Cubit<UserAuthState> {
  final IUserAuthRepository _userAuthRepository;
  StreamSubscription<User?>? _userSub;

  UserAuthCubit(this._userAuthRepository) : super(UserAuthState()) {
    _userSub = _userAuthRepository.userStream.listen((user) {
      if (user == null) {
        emit(state.copyWith(
          user: null,
          isAuthenticated: false,
        ));
      } else if (state.user == null) {
        getUserDetails(user.uid);
      }
    });
  }

  getUserDetails(String uid) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      final user = await _userAuthRepository.getUserDetails(uid);
      log('User details fetched: ${user.uid}');
      emit(state.copyWith(
        isLoading: false,
        user: user,
        isAuthenticated: true,
        isNewUser: user.isNewUser,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      final user =
          await _userAuthRepository.signInWithEmailAndPassword(email, password);

      log('User signed in: ${user.uid}');
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

  Future<void> logOut() async {
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

  Future<void> changePassword(String newPassword) async {
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

  @override
  Future<void> close() {
    _userSub?.cancel();
    return super.close();
  }
}
