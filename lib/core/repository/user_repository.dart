import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pbnhs/features/accounts/repository/user_model/user_model.dart';
import 'package:pbnhs/features/onboarding%20presentations/login/domain/i_user_auth_repo.dart';

class UserAuthRepository implements IUserAuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  UserAuthRepository({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges();
  }

  Future<String?> getCurrentUserId() async {
    return _firebaseAuth.currentUser?.uid;
  }

  @override
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
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
            FirebaseFirestore.instance.collection('admin').doc(userId);

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
  Future<UserModel> getUserDetails(String uid) async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection('admin').doc(uid).get();

      if (userDoc.exists) {
        return UserModel.fromDocument(userDoc);
      } else {
        throw Exception("User not found");
      }
    } catch (e) {
      log("Error fetching user: $e");
      throw Exception("Failed to retrieve user details.");
    }
  }
}
