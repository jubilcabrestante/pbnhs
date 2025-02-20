import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String uid,
    required String name,
    required String email,
    required String role,
    @Default(true) bool isNewUser, // Added isNewUser with a default value
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Convert a Firestore DocumentSnapshot into a UserModel
  factory UserModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;

    if (data == null) {
      throw Exception("Document data is null");
    }

    return UserModel.fromJson({
      ...data,
      'uid': doc.id,
      'isNewUser':
          data['isNewUser'] ?? true, // Ensure it defaults to true if missing
    });
  }
}
