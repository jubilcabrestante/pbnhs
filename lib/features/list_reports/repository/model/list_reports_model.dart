import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_reports_model.freezed.dart';
part 'list_reports_model.g.dart';

@freezed
class ListReportsModel with _$ListReportsModel {
  const factory ListReportsModel({
    required String id,
    required String type,
    required String title,
    required String link,
    @TimestampConverter() required DateTime dateUploaded, // Custom converter
    required String createdBy,
  }) = _ListReportsModel;

  factory ListReportsModel.fromJson(Map<String, dynamic> json) =>
      _$ListReportsModelFromJson(json);

  factory ListReportsModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    if (data == null) {
      throw Exception("Document data is null");
    }

    return ListReportsModel(
      id: doc.id,
      type: data['type'] as String? ?? '',
      title: data['title'] as String? ?? '',
      link: data['link'] as String? ?? '',
      dateUploaded: _parseDate(data['dateUploaded']),
      createdBy: data['createdBy'] as String? ?? '',
    );
  }

  static DateTime _parseDate(dynamic date) {
    if (date is Timestamp) {
      return date.toDate();
    } else if (date is String) {
      return DateTime.tryParse(date) ?? DateTime.now();
    } else {
      return DateTime.now();
    }
  }
}

/// Custom converter to handle Firestore Timestamp
class TimestampConverter implements JsonConverter<DateTime, dynamic> {
  const TimestampConverter();

  @override
  DateTime fromJson(dynamic json) {
    if (json is Timestamp) {
      return json.toDate(); // Convert Firestore Timestamp to DateTime
    } else if (json is String) {
      return DateTime.tryParse(json) ?? DateTime.now(); // Handle string dates
    } else {
      throw Exception("Invalid date format");
    }
  }

  @override
  dynamic toJson(DateTime date) => Timestamp.fromDate(date);
}
