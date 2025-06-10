import 'package:firebase_auth/firebase_auth.dart';
import 'package:pbnhs/features/accounts/repository/user_model/user_model.dart';

abstract class IUserAuthRepository {
  Stream<User?> get userStream;

  Future<UserVm> signInWithEmailAndPassword(String email, String password);

  Future<void> logOut();

  Future<void> resetPassword(String email);

  Future<void> updatePassword(String newPassword);

  Future<UserVm> getUserDetails(String uid);
}
