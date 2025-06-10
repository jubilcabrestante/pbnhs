// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_reports_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListReportsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<ListReportsModel>? get reports => throw _privateConstructorUsedError;
  UserVm? get user => throw _privateConstructorUsedError;

  /// Create a copy of ListReportsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListReportsStateCopyWith<ListReportsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListReportsStateCopyWith<$Res> {
  factory $ListReportsStateCopyWith(
          ListReportsState value, $Res Function(ListReportsState) then) =
      _$ListReportsStateCopyWithImpl<$Res, ListReportsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      String? errorMessage,
      List<ListReportsModel>? reports,
      UserVm? user});
}

/// @nodoc
class _$ListReportsStateCopyWithImpl<$Res, $Val extends ListReportsState>
    implements $ListReportsStateCopyWith<$Res> {
  _$ListReportsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListReportsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? errorMessage = freezed,
    Object? reports = freezed,
    Object? user = freezed,
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
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      reports: freezed == reports
          ? _value.reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<ListReportsModel>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserVm?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListReportsStateImplCopyWith<$Res>
    implements $ListReportsStateCopyWith<$Res> {
  factory _$$ListReportsStateImplCopyWith(_$ListReportsStateImpl value,
          $Res Function(_$ListReportsStateImpl) then) =
      __$$ListReportsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      String? errorMessage,
      List<ListReportsModel>? reports,
      UserVm? user});
}

/// @nodoc
class __$$ListReportsStateImplCopyWithImpl<$Res>
    extends _$ListReportsStateCopyWithImpl<$Res, _$ListReportsStateImpl>
    implements _$$ListReportsStateImplCopyWith<$Res> {
  __$$ListReportsStateImplCopyWithImpl(_$ListReportsStateImpl _value,
      $Res Function(_$ListReportsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListReportsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? errorMessage = freezed,
    Object? reports = freezed,
    Object? user = freezed,
  }) {
    return _then(_$ListReportsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      reports: freezed == reports
          ? _value._reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<ListReportsModel>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserVm?,
    ));
  }
}

/// @nodoc

class _$ListReportsStateImpl implements _ListReportsState {
  const _$ListReportsStateImpl(
      {this.isLoading = false,
      this.isSuccess = false,
      this.errorMessage,
      final List<ListReportsModel>? reports,
      this.user})
      : _reports = reports;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  final String? errorMessage;
  final List<ListReportsModel>? _reports;
  @override
  List<ListReportsModel>? get reports {
    final value = _reports;
    if (value == null) return null;
    if (_reports is EqualUnmodifiableListView) return _reports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UserVm? user;

  @override
  String toString() {
    return 'ListReportsState(isLoading: $isLoading, isSuccess: $isSuccess, errorMessage: $errorMessage, reports: $reports, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListReportsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._reports, _reports) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSuccess,
      errorMessage, const DeepCollectionEquality().hash(_reports), user);

  /// Create a copy of ListReportsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListReportsStateImplCopyWith<_$ListReportsStateImpl> get copyWith =>
      __$$ListReportsStateImplCopyWithImpl<_$ListReportsStateImpl>(
          this, _$identity);
}

abstract class _ListReportsState implements ListReportsState {
  const factory _ListReportsState(
      {final bool isLoading,
      final bool isSuccess,
      final String? errorMessage,
      final List<ListReportsModel>? reports,
      final UserVm? user}) = _$ListReportsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  String? get errorMessage;
  @override
  List<ListReportsModel>? get reports;
  @override
  UserVm? get user;

  /// Create a copy of ListReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListReportsStateImplCopyWith<_$ListReportsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
