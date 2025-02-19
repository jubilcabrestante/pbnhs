import 'package:pbnhs/features/accounts/repository/user_model/user_model.dart';

abstract class IUserAccountRepository {
  Future<void> createUserWithEmailAndPassword(UserModel user, String password);

  Future<void> saveUser(UserModel user);

  Future<List<UserModel>> getUsers();

  Future<void> deleteUser(String uid);
}
