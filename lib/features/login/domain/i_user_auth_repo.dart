import 'package:firebase_auth/firebase_auth.dart';

import '../../accounts/repository/user_model/user_model.dart'; // ✅ Import FirebaseAuth

abstract class IUserAuthRepository {
  Stream<User?> get user;

  Future<void> signIn(String email, String password);

  Future<void> logOut();

  Future<void> resetPassword(String email);

  Future<UserModel> getUserDetails(String uid);

  Future<void> updatePassword(String newPassword);
}
