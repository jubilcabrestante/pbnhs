import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_model.freezed.dart';
part 'type_model.g.dart';

@freezed
class TypeModel with _$TypeModel {
  const factory TypeModel({
    required List<String> types,
  }) = _TypeModel;

  // Convert Firestore document to TypeModel
  factory TypeModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    return TypeModel(
      types: (data?['types'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }

  // Convert TypeModel to Firestore document
  factory TypeModel.fromJson(Map<String, dynamic> json) =>
      _$TypeModelFromJson(json);
}
