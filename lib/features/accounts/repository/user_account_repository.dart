import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pbnhs/features/accounts/repository/account_model/account_vm.dart';
import 'package:pbnhs/features/accounts/repository/user_model/user_model.dart';
import 'package:pbnhs/features/accounts/domain/i_user_account_repo.dart';

class UserAccountRepository implements IUserAccountRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final String adminCollection = 'admin';

  UserAccountRepository({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Stream<User?> get currentUserStream => _firebaseAuth.authStateChanges();

  @override
  Future<void> createUserWithEmailAndPassword(
      AccountVm user, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );

      final authUser = userCredential.user;
      if (authUser == null) throw Exception("User creation failed.");

      final docRef = _firestore.collection(adminCollection).doc(authUser.uid);

      final newUser = UserVm(
        uid: user.uid,
        role: user.role,
        name: user.name,
        email: user.email,
        isNewUser: user.isNewUser,
      );

      await docRef.set(newUser.toJson());
    } catch (e) {
      log("Failed to create user: ${e.toString()}");
      rethrow;
    }
  }

  @override
  Future<List<AccountVm>> getUsers() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('admin').get();

      List<AccountVm> users = querySnapshot.docs.map((doc) {
        return AccountVm.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      log('Fetched users: $users');
      return users;
    } catch (e) {
      log("Failed to fetch users: ${e.toString()}");
      rethrow;
    }
  }

  @override
  Future<void> updateUser(AccountVm user) async {
    try {
      final docRef = _firestore.collection(adminCollection).doc(user.uid);
      await docRef.set(user.toJson(), SetOptions(merge: true));
      log("User updated: ${user.uid}");
    } catch (e) {
      log("Failed to update user: ${e.toString()}");
      rethrow;
    }
  }

  @override
  Future<void> deleteUser(String uid) async {
    try {
      // ✅ Delete user from Firestore
      await _firestore.collection('admin').doc(uid).delete();
      log("User deleted from Firestore: $uid");
    } catch (e) {
      log("Failed to delete user: ${e.toString()}");
      rethrow;
    }
  }
}
