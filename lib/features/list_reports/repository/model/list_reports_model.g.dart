// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_reports_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListReportsModelImpl _$$ListReportsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ListReportsModelImpl(
      id: json['id'] as String?,
      type: json['type'] as String,
      title: json['title'] as String,
      link: json['link'] as String,
      dateUploaded: DateTime.parse(json['dateUploaded'] as String),
      createdBy: json['createdBy'] as String,
    );

Map<String, dynamic> _$$ListReportsModelImplToJson(
        _$ListReportsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'link': instance.link,
      'dateUploaded': instance.dateUploaded.toIso8601String(),
      'createdBy': instance.createdBy,
    };
