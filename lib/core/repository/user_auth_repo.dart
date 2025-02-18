import 'package:firebase_auth/firebase_auth.dart'; // ✅ Import FirebaseAuth

abstract class UserAuthRepository {
  Stream<User?> get user;

  Future<void> signIn(String email, String password);

  Future<void> logOut();

  Future<void> resetPassword(String email);

  Future<void> updatePassword(String newPassword);
}
