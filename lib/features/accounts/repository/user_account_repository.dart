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

  @override
  Future<void> createUserWithEmailAndPassword(
      UserModel user, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: user.email, password: password);

      if (userCredential.user == null) {
        throw Exception("User creation failed.");
      }

      final newUser = UserModel(
        uid: userCredential.user!.uid,
        name: user.name,
        email: user.email,
        role: user.role,
      );

      await saveUser(newUser);
    } catch (e) {
      log("Failed to create user: ${e.toString()}");
      rethrow;
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      // Fetch all users from the 'admin' collection
      QuerySnapshot querySnapshot = await _firestore.collection('admin').get();

      // Convert each document into a UserModel instance
      List<UserModel> users = querySnapshot.docs.map((doc) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      log('$users');

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
      await _firestore.collection('admin').doc(uid).delete();
    } catch (e) {
      log("Failed to delete user: ${e.toString()}");
      rethrow;
    }
  }
}
