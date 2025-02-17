import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pbnhs/core/enum/user_roles.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? uid,
    required String name,
    required String email,
    required UserRole role,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
