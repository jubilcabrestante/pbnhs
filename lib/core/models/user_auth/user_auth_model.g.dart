// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAuthModelImpl _$$UserAuthModelImplFromJson(Map<String, dynamic> json) =>
    _$UserAuthModelImpl(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      isAuthenticated: json['isAuthenticated'] as bool,
    );

Map<String, dynamic> _$$UserAuthModelImplToJson(_$UserAuthModelImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'isAuthenticated': instance.isAuthenticated,
    };
