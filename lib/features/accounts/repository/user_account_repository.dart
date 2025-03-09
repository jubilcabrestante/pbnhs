import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pbnhs/features/accounts/repository/user_model/user_model.dart';
import 'package:pbnhs/features/accounts/domain/i_user_account_repo.dart';

class UserAccountRepository implements IUserAccountRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  UserAccountRepository({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  /// Stream the current authenticated user
  @override
  Stream<User?> get currentUserStream => _firebaseAuth.authStateChanges();

  @override
  Future<void> createUserWithEmailAndPassword(
      UserModel user, String password, String adminPassword) async {
    UserCredential? userCredential;

    try {
      // ✅ Store the current admin user before creating a new account
      User? currentUser = _firebaseAuth.currentUser;
      String? currentEmail = currentUser!.email;

      // ✅ Create user in Firebase Auth first
      userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );

      if (userCredential.user == null) {
        throw Exception("User creation failed.");
      }

      String newUserId = userCredential.user!.uid;
      final newUser = user.copyWith(uid: newUserId);

      // ✅ Sign back in with the original admin account
      if (currentEmail != null) {
        await _firebaseAuth.signInWithEmailAndPassword(
          email: currentEmail,
          password: adminPassword,
        );
      } else {
        log("Failed to sign back in as admin. Please re-authenticate.");
      }

      return await saveUser(newUser);
    } catch (e) {
      log("Failed to create user: ${e.toString()}");
      rethrow;
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('admin').get();

      List<UserModel> users = querySnapshot.docs.map((doc) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      log('Fetched users: $users');
      return users;
    } catch (e) {
      log("Failed to fetch users: ${e.toString()}");
      rethrow;
    }
  }

  @override
  Future<void> saveUser(UserModel user) async {
    try {
      await _firestore.collection('admin').doc(user.uid).set(user.toJson());
    } catch (e) {
      log("Failed to save user: ${e.toString()}");
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
