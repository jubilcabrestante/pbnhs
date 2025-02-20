// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      isNewUser: json['isNewUser'] as bool? ?? true,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'isNewUser': instance.isNewUser,
    };
