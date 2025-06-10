// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_type_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListTypeState {
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isRole => throw _privateConstructorUsedError;
  List<TypeVm> get typeVm => throw _privateConstructorUsedError;
  String? get selectedType => throw _privateConstructorUsedError;

  /// Create a copy of ListTypeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListTypeStateCopyWith<ListTypeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListTypeStateCopyWith<$Res> {
  factory $ListTypeStateCopyWith(
          ListTypeState value, $Res Function(ListTypeState) then) =
      _$ListTypeStateCopyWithImpl<$Res, ListTypeState>;
  @useResult
  $Res call(
      {String? errorMessage,
      bool isLoading,
      bool isSuccess,
      bool isRole,
      List<TypeVm> typeVm,
      String? selectedType});
}

/// @nodoc
class _$ListTypeStateCopyWithImpl<$Res, $Val extends ListTypeState>
    implements $ListTypeStateCopyWith<$Res> {
  _$ListTypeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListTypeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isRole = null,
    Object? typeVm = null,
    Object? selectedType = freezed,
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
      isRole: null == isRole
          ? _value.isRole
          : isRole // ignore: cast_nullable_to_non_nullable
              as bool,
      typeVm: null == typeVm
          ? _value.typeVm
          : typeVm // ignore: cast_nullable_to_non_nullable
              as List<TypeVm>,
      selectedType: freezed == selectedType
          ? _value.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListTypeStateImplCopyWith<$Res>
    implements $ListTypeStateCopyWith<$Res> {
  factory _$$ListTypeStateImplCopyWith(
          _$ListTypeStateImpl value, $Res Function(_$ListTypeStateImpl) then) =
      __$$ListTypeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? errorMessage,
      bool isLoading,
      bool isSuccess,
      bool isRole,
      List<TypeVm> typeVm,
      String? selectedType});
}

/// @nodoc
class __$$ListTypeStateImplCopyWithImpl<$Res>
    extends _$ListTypeStateCopyWithImpl<$Res, _$ListTypeStateImpl>
    implements _$$ListTypeStateImplCopyWith<$Res> {
  __$$ListTypeStateImplCopyWithImpl(
      _$ListTypeStateImpl _value, $Res Function(_$ListTypeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListTypeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isRole = null,
    Object? typeVm = null,
    Object? selectedType = freezed,
  }) {
    return _then(_$ListTypeStateImpl(
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
      isRole: null == isRole
          ? _value.isRole
          : isRole // ignore: cast_nullable_to_non_nullable
              as bool,
      typeVm: null == typeVm
          ? _value._typeVm
          : typeVm // ignore: cast_nullable_to_non_nullable
              as List<TypeVm>,
      selectedType: freezed == selectedType
          ? _value.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ListTypeStateImpl implements _ListTypeState {
  const _$ListTypeStateImpl(
      {this.errorMessage,
      this.isLoading = false,
      this.isSuccess = false,
      this.isRole = false,
      final List<TypeVm> typeVm = const [],
      this.selectedType})
      : _typeVm = typeVm;

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
  final bool isRole;
  final List<TypeVm> _typeVm;
  @override
  @JsonKey()
  List<TypeVm> get typeVm {
    if (_typeVm is EqualUnmodifiableListView) return _typeVm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_typeVm);
  }

  @override
  final String? selectedType;

  @override
  String toString() {
    return 'ListTypeState(errorMessage: $errorMessage, isLoading: $isLoading, isSuccess: $isSuccess, isRole: $isRole, typeVm: $typeVm, selectedType: $selectedType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListTypeStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isRole, isRole) || other.isRole == isRole) &&
            const DeepCollectionEquality().equals(other._typeVm, _typeVm) &&
            (identical(other.selectedType, selectedType) ||
                other.selectedType == selectedType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      errorMessage,
      isLoading,
      isSuccess,
      isRole,
      const DeepCollectionEquality().hash(_typeVm),
      selectedType);

  /// Create a copy of ListTypeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListTypeStateImplCopyWith<_$ListTypeStateImpl> get copyWith =>
      __$$ListTypeStateImplCopyWithImpl<_$ListTypeStateImpl>(this, _$identity);
}

abstract class _ListTypeState implements ListTypeState {
  const factory _ListTypeState(
      {final String? errorMessage,
      final bool isLoading,
      final bool isSuccess,
      final bool isRole,
      final List<TypeVm> typeVm,
      final String? selectedType}) = _$ListTypeStateImpl;

  @override
  String? get errorMessage;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isRole;
  @override
  List<TypeVm> get typeVm;
  @override
  String? get selectedType;

  /// Create a copy of ListTypeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListTypeStateImplCopyWith<_$ListTypeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
