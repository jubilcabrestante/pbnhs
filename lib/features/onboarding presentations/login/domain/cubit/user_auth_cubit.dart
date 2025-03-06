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
    // Reset state before attempting sign-in
    emit(const UserAuthState().copyWith(isLoading: true));

    log("🔍 Attempting sign-in with email: $email");

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? firebaseUser = userCredential.user;

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
          isNewUser: userModel.isNewUser,
          userAuthModel: userAuth,
        ));
      } else {
        log("❌ Login failed: Invalid credentials");
        emit(const UserAuthState().copyWith(
            isLoading: false, errorMessage: "Invalid email or password"));
      }
    } on FirebaseAuthException catch (e) {
      log("🔥 FirebaseAuthException: ${e.message}");
      emit(const UserAuthState()
          .copyWith(isLoading: false, errorMessage: e.message));
    } catch (e) {
      log("❌ Error: $e");
      emit(const UserAuthState().copyWith(
          isLoading: false, errorMessage: "An unexpected error occurred"));
    }
  }

  Future<void> changePassword(String newPassword) async {
    emit(const UserAuthState().copyWith(isLoading: true));

    try {
      await _userAuthRepository.updatePassword(newPassword);
      await _userAuthRepository.logOut(); // Force logout
      emit(const UserAuthState().copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      log("Error: $e");
      emit(const UserAuthState()
          .copyWith(isLoading: false, errorMessage: e.toString()));
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
