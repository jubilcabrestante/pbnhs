// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserAuthState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isNewUser => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  UserAuthModel? get userAuthModel => throw _privateConstructorUsedError;

  /// Create a copy of UserAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAuthStateCopyWith<UserAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAuthStateCopyWith<$Res> {
  factory $UserAuthStateCopyWith(
          UserAuthState value, $Res Function(UserAuthState) then) =
      _$UserAuthStateCopyWithImpl<$Res, UserAuthState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isNewUser,
      String? errorMessage,
      UserAuthModel? userAuthModel});

  $UserAuthModelCopyWith<$Res>? get userAuthModel;
}

/// @nodoc
class _$UserAuthStateCopyWithImpl<$Res, $Val extends UserAuthState>
    implements $UserAuthStateCopyWith<$Res> {
  _$UserAuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isNewUser = null,
    Object? errorMessage = freezed,
    Object? userAuthModel = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isNewUser: null == isNewUser
          ? _value.isNewUser
          : isNewUser // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      userAuthModel: freezed == userAuthModel
          ? _value.userAuthModel
          : userAuthModel // ignore: cast_nullable_to_non_nullable
              as UserAuthModel?,
    ) as $Val);
  }

  /// Create a copy of UserAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserAuthModelCopyWith<$Res>? get userAuthModel {
    if (_value.userAuthModel == null) {
      return null;
    }

    return $UserAuthModelCopyWith<$Res>(_value.userAuthModel!, (value) {
      return _then(_value.copyWith(userAuthModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserAuthStateImplCopyWith<$Res>
    implements $UserAuthStateCopyWith<$Res> {
  factory _$$UserAuthStateImplCopyWith(
          _$UserAuthStateImpl value, $Res Function(_$UserAuthStateImpl) then) =
      __$$UserAuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isNewUser,
      String? errorMessage,
      UserAuthModel? userAuthModel});

  @override
  $UserAuthModelCopyWith<$Res>? get userAuthModel;
}

/// @nodoc
class __$$UserAuthStateImplCopyWithImpl<$Res>
    extends _$UserAuthStateCopyWithImpl<$Res, _$UserAuthStateImpl>
    implements _$$UserAuthStateImplCopyWith<$Res> {
  __$$UserAuthStateImplCopyWithImpl(
      _$UserAuthStateImpl _value, $Res Function(_$UserAuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isNewUser = null,
    Object? errorMessage = freezed,
    Object? userAuthModel = freezed,
  }) {
    return _then(_$UserAuthStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isNewUser: null == isNewUser
          ? _value.isNewUser
          : isNewUser // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      userAuthModel: freezed == userAuthModel
          ? _value.userAuthModel
          : userAuthModel // ignore: cast_nullable_to_non_nullable
              as UserAuthModel?,
    ));
  }
}

/// @nodoc

class _$UserAuthStateImpl implements _UserAuthState {
  const _$UserAuthStateImpl(
      {this.isLoading = false,
      this.isSuccess = false,
      this.isNewUser = true,
      this.errorMessage,
      this.userAuthModel});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final bool isNewUser;
  @override
  final String? errorMessage;
  @override
  final UserAuthModel? userAuthModel;

  @override
  String toString() {
    return 'UserAuthState(isLoading: $isLoading, isSuccess: $isSuccess, isNewUser: $isNewUser, errorMessage: $errorMessage, userAuthModel: $userAuthModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAuthStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isNewUser, isNewUser) ||
                other.isNewUser == isNewUser) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.userAuthModel, userAuthModel) ||
                other.userAuthModel == userAuthModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSuccess, isNewUser,
      errorMessage, userAuthModel);

  /// Create a copy of UserAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAuthStateImplCopyWith<_$UserAuthStateImpl> get copyWith =>
      __$$UserAuthStateImplCopyWithImpl<_$UserAuthStateImpl>(this, _$identity);
}

abstract class _UserAuthState implements UserAuthState {
  const factory _UserAuthState(
      {final bool isLoading,
      final bool isSuccess,
      final bool isNewUser,
      final String? errorMessage,
      final UserAuthModel? userAuthModel}) = _$UserAuthStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isNewUser;
  @override
  String? get errorMessage;
  @override
  UserAuthModel? get userAuthModel;

  /// Create a copy of UserAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAuthStateImplCopyWith<_$UserAuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
