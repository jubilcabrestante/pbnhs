import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_reports_model.freezed.dart';
part 'list_reports_model.g.dart';

@freezed
class ListReportsModel with _$ListReportsModel {
  const factory ListReportsModel({
    String? id,
    required String type,
    required String title,
    required String link,
    required DateTime dateUploaded,
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
    return ListReportsModel.fromJson({
      'id': doc.id,
      ...data,
    });
  }
}
