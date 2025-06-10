// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_vm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountVm _$AccountVmFromJson(Map<String, dynamic> json) => AccountVm(
      uid: json['uid'] as String,
      role: json['role'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      isNewUser: json['isNewUser'] as bool,
    );

Map<String, dynamic> _$AccountVmToJson(AccountVm instance) => <String, dynamic>{
      'uid': instance.uid,
      'role': instance.role,
      'name': instance.name,
      'email': instance.email,
      'isNewUser': instance.isNewUser,
    };
