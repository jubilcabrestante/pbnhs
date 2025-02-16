// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthUserState {
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isLogoutSuccess => throw _privateConstructorUsedError;
  bool get isOnCheckUser => throw _privateConstructorUsedError;
  bool get isLogoutLoading => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;

  /// Create a copy of AuthUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthUserStateCopyWith<AuthUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthUserStateCopyWith<$Res> {
  factory $AuthUserStateCopyWith(
          AuthUserState value, $Res Function(AuthUserState) then) =
      _$AuthUserStateCopyWithImpl<$Res, AuthUserState>;
  @useResult
  $Res call(
      {String? errorMessage,
      bool isLoading,
      bool isSuccess,
      bool isLogoutSuccess,
      bool isOnCheckUser,
      bool isLogoutLoading,
      bool isConnected});
}

/// @nodoc
class _$AuthUserStateCopyWithImpl<$Res, $Val extends AuthUserState>
    implements $AuthUserStateCopyWith<$Res> {
  _$AuthUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthUserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isLogoutSuccess = null,
    Object? isOnCheckUser = null,
    Object? isLogoutLoading = null,
    Object? isConnected = null,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutSuccess: null == isLogoutSuccess
          ? _value.isLogoutSuccess
          : isLogoutSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isOnCheckUser: null == isOnCheckUser
          ? _value.isOnCheckUser
          : isOnCheckUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutLoading: null == isLogoutLoading
          ? _value.isLogoutLoading
          : isLogoutLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthUserStateImplCopyWith<$Res>
    implements $AuthUserStateCopyWith<$Res> {
  factory _$$AuthUserStateImplCopyWith(
          _$AuthUserStateImpl value, $Res Function(_$AuthUserStateImpl) then) =
      __$$AuthUserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? errorMessage,
      bool isLoading,
      bool isSuccess,
      bool isLogoutSuccess,
      bool isOnCheckUser,
      bool isLogoutLoading,
      bool isConnected});
}

/// @nodoc
class __$$AuthUserStateImplCopyWithImpl<$Res>
    extends _$AuthUserStateCopyWithImpl<$Res, _$AuthUserStateImpl>
    implements _$$AuthUserStateImplCopyWith<$Res> {
  __$$AuthUserStateImplCopyWithImpl(
      _$AuthUserStateImpl _value, $Res Function(_$AuthUserStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthUserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isLogoutSuccess = null,
    Object? isOnCheckUser = null,
    Object? isLogoutLoading = null,
    Object? isConnected = null,
  }) {
    return _then(_$AuthUserStateImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutSuccess: null == isLogoutSuccess
          ? _value.isLogoutSuccess
          : isLogoutSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isOnCheckUser: null == isOnCheckUser
          ? _value.isOnCheckUser
          : isOnCheckUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutLoading: null == isLogoutLoading
          ? _value.isLogoutLoading
          : isLogoutLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthUserStateImpl implements _AuthUserState {
  const _$AuthUserStateImpl(
      {this.errorMessage,
      this.isLoading = false,
      this.isSuccess = false,
      this.isLogoutSuccess = false,
      this.isOnCheckUser = false,
      this.isLogoutLoading = false,
      this.isConnected = false});

  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final bool isLogoutSuccess;
  @override
  @JsonKey()
  final bool isOnCheckUser;
  @override
  @JsonKey()
  final bool isLogoutLoading;
  @override
  @JsonKey()
  final bool isConnected;

  @override
  String toString() {
    return 'AuthUserState(errorMessage: $errorMessage, isLoading: $isLoading, isSuccess: $isSuccess, isLogoutSuccess: $isLogoutSuccess, isOnCheckUser: $isOnCheckUser, isLogoutLoading: $isLogoutLoading, isConnected: $isConnected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUserStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isLogoutSuccess, isLogoutSuccess) ||
                other.isLogoutSuccess == isLogoutSuccess) &&
            (identical(other.isOnCheckUser, isOnCheckUser) ||
                other.isOnCheckUser == isOnCheckUser) &&
            (identical(other.isLogoutLoading, isLogoutLoading) ||
                other.isLogoutLoading == isLogoutLoading) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, isLoading,
      isSuccess, isLogoutSuccess, isOnCheckUser, isLogoutLoading, isConnected);

  /// Create a copy of AuthUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthUserStateImplCopyWith<_$AuthUserStateImpl> get copyWith =>
      __$$AuthUserStateImplCopyWithImpl<_$AuthUserStateImpl>(this, _$identity);
}

abstract class _AuthUserState implements AuthUserState {
  const factory _AuthUserState(
      {final String? errorMessage,
      final bool isLoading,
      final bool isSuccess,
      final bool isLogoutSuccess,
      final bool isOnCheckUser,
      final bool isLogoutLoading,
      final bool isConnected}) = _$AuthUserStateImpl;

  @override
  String? get errorMessage;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isLogoutSuccess;
  @override
  bool get isOnCheckUser;
  @override
  bool get isLogoutLoading;
  @override
  bool get isConnected;

  /// Create a copy of AuthUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthUserStateImplCopyWith<_$AuthUserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
