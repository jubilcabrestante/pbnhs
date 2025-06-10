// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_reports_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListReportsModel _$ListReportsModelFromJson(Map<String, dynamic> json) {
  return _ListReportsModel.fromJson(json);
}

/// @nodoc
mixin _$ListReportsModel {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get dateUploaded => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;

  /// Serializes this ListReportsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListReportsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListReportsModelCopyWith<ListReportsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListReportsModelCopyWith<$Res> {
  factory $ListReportsModelCopyWith(
          ListReportsModel value, $Res Function(ListReportsModel) then) =
      _$ListReportsModelCopyWithImpl<$Res, ListReportsModel>;
  @useResult
  $Res call(
      {String id,
      String type,
      String title,
      String link,
      @TimestampConverter() DateTime dateUploaded,
      String createdBy});
}

/// @nodoc
class _$ListReportsModelCopyWithImpl<$Res, $Val extends ListReportsModel>
    implements $ListReportsModelCopyWith<$Res> {
  _$ListReportsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListReportsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? link = null,
    Object? dateUploaded = null,
    Object? createdBy = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      dateUploaded: null == dateUploaded
          ? _value.dateUploaded
          : dateUploaded // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListReportsModelImplCopyWith<$Res>
    implements $ListReportsModelCopyWith<$Res> {
  factory _$$ListReportsModelImplCopyWith(_$ListReportsModelImpl value,
          $Res Function(_$ListReportsModelImpl) then) =
      __$$ListReportsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String title,
      String link,
      @TimestampConverter() DateTime dateUploaded,
      String createdBy});
}

/// @nodoc
class __$$ListReportsModelImplCopyWithImpl<$Res>
    extends _$ListReportsModelCopyWithImpl<$Res, _$ListReportsModelImpl>
    implements _$$ListReportsModelImplCopyWith<$Res> {
  __$$ListReportsModelImplCopyWithImpl(_$ListReportsModelImpl _value,
      $Res Function(_$ListReportsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListReportsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? link = null,
    Object? dateUploaded = null,
    Object? createdBy = null,
  }) {
    return _then(_$ListReportsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      dateUploaded: null == dateUploaded
          ? _value.dateUploaded
          : dateUploaded // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListReportsModelImpl implements _ListReportsModel {
  const _$ListReportsModelImpl(
      {required this.id,
      required this.type,
      required this.title,
      required this.link,
      @TimestampConverter() required this.dateUploaded,
      required this.createdBy});

  factory _$ListReportsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListReportsModelImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String title;
  @override
  final String link;
  @override
  @TimestampConverter()
  final DateTime dateUploaded;
  @override
  final String createdBy;

  @override
  String toString() {
    return 'ListReportsModel(id: $id, type: $type, title: $title, link: $link, dateUploaded: $dateUploaded, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListReportsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.dateUploaded, dateUploaded) ||
                other.dateUploaded == dateUploaded) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, title, link, dateUploaded, createdBy);

  /// Create a copy of ListReportsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListReportsModelImplCopyWith<_$ListReportsModelImpl> get copyWith =>
      __$$ListReportsModelImplCopyWithImpl<_$ListReportsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListReportsModelImplToJson(
      this,
    );
  }
}

abstract class _ListReportsModel implements ListReportsModel {
  const factory _ListReportsModel(
      {required final String id,
      required final String type,
      required final String title,
      required final String link,
      @TimestampConverter() required final DateTime dateUploaded,
      required final String createdBy}) = _$ListReportsModelImpl;

  factory _ListReportsModel.fromJson(Map<String, dynamic> json) =
      _$ListReportsModelImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get title;
  @override
  String get link;
  @override
  @TimestampConverter()
  DateTime get dateUploaded;
  @override
  String get createdBy;

  /// Create a copy of ListReportsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListReportsModelImplCopyWith<_$ListReportsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
