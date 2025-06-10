import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pbnhs/core/domain/i_user_auth_repo.dart';
import 'package:pbnhs/features/accounts/repository/user_model/user_model.dart';

class UserAuthRepository implements IUserAuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final String adminCollection = 'admin';

  UserAuthRepository({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<UserVm> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user == null) {
        throw Exception("User not found after sign-in");
      }

      final doc =
          await _firestore.collection(adminCollection).doc(user.uid).get();
      if (!doc.exists) {
        throw Exception("User data not found in Firestore");
      }

      return UserVm.fromJson(doc.data()!);
    } catch (e) {
      log("Sign-in failed: ${e.toString()}");
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      log("Logout failed: ${e.toString()}");
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      log("Password reset failed: ${e.toString()}");
      rethrow;
    }
  }

  @override
  Future<void> updatePassword(String newPassword) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        // 🔐 Update password in Firebase Authentication
        await user.updatePassword(newPassword);

        final userId = user.uid;
        final userDocRef =
            FirebaseFirestore.instance.collection(adminCollection).doc(userId);

        // 🔄 Create or update 'isNewUser' field
        await userDocRef.set(
          {'isNewUser': false},
          SetOptions(merge: true), // ✅ Creates if missing, updates if exists
        );
      } else {
        throw Exception('User is not logged in');
      }
    } catch (e) {
      log("❌ Password update failed: ${e.toString()}");
      rethrow;
    }
  }

  @override
  Future<UserVm> getUserDetails(String uid) async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection(adminCollection).doc(uid).get();

      if (userDoc.exists) {
        return UserVm.fromJson(userDoc.data() as Map<String, dynamic>);
      } else {
        throw Exception("User not found");
      }
    } catch (e) {
      log("Error fetching user: $e");
      throw Exception("Failed to retrieve user details.");
    }
  }
}
