import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/repository/user_repository.dart';
import '../../../../../core/models/user_auth/user_auth_model.dart';
import '../../../../accounts/repository/user_model/user_model.dart';
import 'user_auth_state.dart';

class UserAuthCubit extends Cubit<UserAuthState> {
  final UserAuthRepository _userAuthRepository;

  UserAuthCubit(this._userAuthRepository) : super(const UserAuthState());

  Future<void> signIn(String email, String password) async {
    emit(state.copyWith(isLoading: true));
    log("🔍 Attempting sign-in with email: $email");

    try {
      User? firebaseUser = await _userAuthRepository.signIn(email, password);

      if (firebaseUser != null) {
        log("✅ Firebase user signed in: ${firebaseUser.uid}");

        UserModel userModel =
            await _userAuthRepository.getUserDetails(firebaseUser.uid);
        log("🛠 Retrieved user details: ${userModel.toJson()}");

        UserAuthModel userAuth = UserAuthModel(
          user: userModel,
          isAuthenticated: true,
        );

        emit(state.copyWith(
          isSuccess: true,
          isLoading: false,
          isNewUser: userModel.isNewUser, // ✅ Get isNewUser from UserModel
          userAuthModel: userAuth,
        ));

        log("🚀 isNewUser: ${userModel.isNewUser}");
      } else {
        log("❌ Login failed");
        emit(state.copyWith(isLoading: false, errorMessage: "Login failed"));
      }
    } on FirebaseAuthException catch (e) {
      log("🔥 FirebaseAuthException: ${e.message}");
      emit(state.copyWith(isLoading: false, errorMessage: e.message));
    }
  }

  Future<void> changePassword(String newPassword) async {
    emit(state.copyWith(isLoading: true, isSuccess: false, errorMessage: null));

    try {
      await _userAuthRepository.updatePassword(newPassword);

      emit(state.copyWith(isLoading: false, isSuccess: true, isNewUser: false));
    } catch (e) {
      log("Error: $e");
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> logOut() async {
    emit(state.copyWith(isLoading: true));
    try {
      await _userAuthRepository.logOut();
      emit(state.copyWith(
          isSuccess: false, isLoading: false, userAuthModel: null));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
