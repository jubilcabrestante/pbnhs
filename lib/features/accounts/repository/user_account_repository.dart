import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pbnhs/features/accounts/repository/account_model/account_vm.dart';
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
      final currentUser = _firebaseAuth.currentUser;
      log("Current user: ${currentUser?.uid}");
      if (currentUser == null) {
        throw Exception("No super-admin is currently signed in.");
      }

      final FirebaseApp tempApp = await Firebase.initializeApp(
        name: 'SecondaryApp',
        options: Firebase.app().options,
      );

      final tempAuth = FirebaseAuth.instanceFor(app: tempApp);
      final userCredential = await tempAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );

      final authUser = userCredential.user;
      if (authUser == null) throw Exception("User creation failed.");

      final docRef = _firestore.collection(adminCollection).doc(authUser.uid);
      await docRef.set({
        'uid': authUser.uid,
        'role': user.role,
        'name': user.name,
        'email': user.email,
        'isNewUser': user.isNewUser,
      });

      // Clean up the temporary app to avoid memory leaks
      await tempApp.delete();

      log("User created successfully without switching accounts");
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
      await _firestore.collection('admin').doc(uid).delete();
      log("User deleted from Firestore: $uid");
    } catch (e) {
      log("Failed to delete user: ${e.toString()}");
      rethrow;
    }
  }
}
