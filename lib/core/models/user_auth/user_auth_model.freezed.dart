// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_auth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserAuthModel _$UserAuthModelFromJson(Map<String, dynamic> json) {
  return _UserAuthModel.fromJson(json);
}

/// @nodoc
mixin _$UserAuthModel {
  UserModel get user => throw _privateConstructorUsedError; // Nested model
  bool get isAuthenticated => throw _privateConstructorUsedError;

  /// Serializes this UserAuthModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAuthModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAuthModelCopyWith<UserAuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAuthModelCopyWith<$Res> {
  factory $UserAuthModelCopyWith(
          UserAuthModel value, $Res Function(UserAuthModel) then) =
      _$UserAuthModelCopyWithImpl<$Res, UserAuthModel>;
  @useResult
  $Res call({UserModel user, bool isAuthenticated});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$UserAuthModelCopyWithImpl<$Res, $Val extends UserAuthModel>
    implements $UserAuthModelCopyWith<$Res> {
  _$UserAuthModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAuthModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? isAuthenticated = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of UserAuthModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserAuthModelImplCopyWith<$Res>
    implements $UserAuthModelCopyWith<$Res> {
  factory _$$UserAuthModelImplCopyWith(
          _$UserAuthModelImpl value, $Res Function(_$UserAuthModelImpl) then) =
      __$$UserAuthModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserModel user, bool isAuthenticated});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserAuthModelImplCopyWithImpl<$Res>
    extends _$UserAuthModelCopyWithImpl<$Res, _$UserAuthModelImpl>
    implements _$$UserAuthModelImplCopyWith<$Res> {
  __$$UserAuthModelImplCopyWithImpl(
      _$UserAuthModelImpl _value, $Res Function(_$UserAuthModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAuthModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? isAuthenticated = null,
  }) {
    return _then(_$UserAuthModelImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAuthModelImpl extends _UserAuthModel {
  const _$UserAuthModelImpl({required this.user, required this.isAuthenticated})
      : super._();

  factory _$UserAuthModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAuthModelImplFromJson(json);

  @override
  final UserModel user;
// Nested model
  @override
  final bool isAuthenticated;

  @override
  String toString() {
    return 'UserAuthModel(user: $user, isAuthenticated: $isAuthenticated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAuthModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isAuthenticated, isAuthenticated) ||
                other.isAuthenticated == isAuthenticated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, isAuthenticated);

  /// Create a copy of UserAuthModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAuthModelImplCopyWith<_$UserAuthModelImpl> get copyWith =>
      __$$UserAuthModelImplCopyWithImpl<_$UserAuthModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAuthModelImplToJson(
      this,
    );
  }
}

abstract class _UserAuthModel extends UserAuthModel {
  const factory _UserAuthModel(
      {required final UserModel user,
      required final bool isAuthenticated}) = _$UserAuthModelImpl;
  const _UserAuthModel._() : super._();

  factory _UserAuthModel.fromJson(Map<String, dynamic> json) =
      _$UserAuthModelImpl.fromJson;

  @override
  UserModel get user; // Nested model
  @override
  bool get isAuthenticated;

  /// Create a copy of UserAuthModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAuthModelImplCopyWith<_$UserAuthModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
