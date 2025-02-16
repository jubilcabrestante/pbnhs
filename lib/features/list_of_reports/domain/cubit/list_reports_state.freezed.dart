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
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isRole => throw _privateConstructorUsedError;
  List<TypeModel> get typeModel => throw _privateConstructorUsedError;
  TypeModel? get selectedType => throw _privateConstructorUsedError;

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
      {String? errorMessage,
      bool isLoading,
      bool isSuccess,
      bool isRole,
      List<TypeModel> typeModel,
      TypeModel? selectedType});

  $TypeModelCopyWith<$Res>? get selectedType;
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
    Object? errorMessage = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isRole = null,
    Object? typeModel = null,
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
      typeModel: null == typeModel
          ? _value.typeModel
          : typeModel // ignore: cast_nullable_to_non_nullable
              as List<TypeModel>,
      selectedType: freezed == selectedType
          ? _value.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as TypeModel?,
    ) as $Val);
  }

  /// Create a copy of ListReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TypeModelCopyWith<$Res>? get selectedType {
    if (_value.selectedType == null) {
      return null;
    }

    return $TypeModelCopyWith<$Res>(_value.selectedType!, (value) {
      return _then(_value.copyWith(selectedType: value) as $Val);
    });
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
      {String? errorMessage,
      bool isLoading,
      bool isSuccess,
      bool isRole,
      List<TypeModel> typeModel,
      TypeModel? selectedType});

  @override
  $TypeModelCopyWith<$Res>? get selectedType;
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
    Object? errorMessage = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isRole = null,
    Object? typeModel = null,
    Object? selectedType = freezed,
  }) {
    return _then(_$ListReportsStateImpl(
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
      typeModel: null == typeModel
          ? _value._typeModel
          : typeModel // ignore: cast_nullable_to_non_nullable
              as List<TypeModel>,
      selectedType: freezed == selectedType
          ? _value.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as TypeModel?,
    ));
  }
}

/// @nodoc

class _$ListReportsStateImpl implements _ListReportsState {
  const _$ListReportsStateImpl(
      {this.errorMessage,
      this.isLoading = false,
      this.isSuccess = false,
      this.isRole = false,
      final List<TypeModel> typeModel = const [],
      this.selectedType})
      : _typeModel = typeModel;

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
  final List<TypeModel> _typeModel;
  @override
  @JsonKey()
  List<TypeModel> get typeModel {
    if (_typeModel is EqualUnmodifiableListView) return _typeModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_typeModel);
  }

  @override
  final TypeModel? selectedType;

  @override
  String toString() {
    return 'ListReportsState(errorMessage: $errorMessage, isLoading: $isLoading, isSuccess: $isSuccess, isRole: $isRole, typeModel: $typeModel, selectedType: $selectedType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListReportsStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isRole, isRole) || other.isRole == isRole) &&
            const DeepCollectionEquality()
                .equals(other._typeModel, _typeModel) &&
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
      const DeepCollectionEquality().hash(_typeModel),
      selectedType);

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
      {final String? errorMessage,
      final bool isLoading,
      final bool isSuccess,
      final bool isRole,
      final List<TypeModel> typeModel,
      final TypeModel? selectedType}) = _$ListReportsStateImpl;

  @override
  String? get errorMessage;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isRole;
  @override
  List<TypeModel> get typeModel;
  @override
  TypeModel? get selectedType;

  /// Create a copy of ListReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListReportsStateImplCopyWith<_$ListReportsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
