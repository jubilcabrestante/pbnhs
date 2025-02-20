import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../features/accounts/repository/user_model/user_model.dart';

part 'user_auth_model.freezed.dart';
part 'user_auth_model.g.dart';

@freezed
class UserAuthModel with _$UserAuthModel {
  const UserAuthModel._(); // ✅ Required for custom getters

  const factory UserAuthModel({
    required UserModel user, // Nested model
    required bool isAuthenticated, // Extra field
  }) = _UserAuthModel;

  factory UserAuthModel.fromJson(Map<String, dynamic> json) =>
      _$UserAuthModelFromJson(json);

  String get userRole => user.role;
}
