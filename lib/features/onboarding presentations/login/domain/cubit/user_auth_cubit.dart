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
    try {
      User? firebaseUser = await _userAuthRepository.signIn(email, password);

      if (firebaseUser != null) {
        UserModel userModel =
            await _userAuthRepository.getUserDetails(firebaseUser.uid);

        UserAuthModel userAuth = UserAuthModel(
          user: userModel,
          isAuthenticated: true,
        );

        emit(state.copyWith(
          isSuccess: true,
          isLoading: false,
          userAuthModel: userAuth, // ✅ Store user data
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: "User authentication failed",
        ));
      }
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.message));
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
