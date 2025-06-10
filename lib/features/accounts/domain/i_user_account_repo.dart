import 'package:firebase_auth/firebase_auth.dart';
import 'package:pbnhs/features/accounts/repository/account_model/account_vm.dart';

abstract class IUserAccountRepository {
  Stream<User?> get currentUserStream;

  Future<void> createUserWithEmailAndPassword(AccountVm user, String password);

  Future<List<AccountVm>> getUsers();

  Future<void> updateUser(AccountVm user);

  Future<void> deleteUser(String uid);
}
