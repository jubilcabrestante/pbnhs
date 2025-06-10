import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_vm.g.dart';

@JsonSerializable()
class AccountVm {
  final String uid;
  final String role;
  final String name;
  final String email;
  final bool isNewUser;

  const AccountVm({
    required this.uid,
    required this.role,
    required this.name,
    required this.email,
    required this.isNewUser,
  });

  factory AccountVm.fromJson(Map<String, dynamic> json) =>
      _$AccountVmFromJson(json);

  Map<String, dynamic> toJson() => _$AccountVmToJson(this);
}
