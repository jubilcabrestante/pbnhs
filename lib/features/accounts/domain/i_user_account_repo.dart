import 'package:firebase_auth/firebase_auth.dart';
import 'package:pbnhs/features/accounts/repository/user_model/user_model.dart';

abstract class IUserAccountRepository {
  Stream<User?> get currentUserStream;

  Future<void> createUserWithEmailAndPassword(
      UserModel user, String password, String adminPassword);

  Future<void> saveUser(UserModel user);
  Future<List<UserModel>> getUsers();

  Future<void> deleteUser(String uid);
}
