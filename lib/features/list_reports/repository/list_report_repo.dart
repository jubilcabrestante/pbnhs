import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pbnhs/features/list_reports/repository/model/list_reports_model.dart';

class ListReportsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ListReportsModel>> getReport(String selectedType) async {
    final querySnapshot = await _firestore
        .collection('reports')
        .where('type', isEqualTo: selectedType)
        .get();

    return querySnapshot.docs
        .map((doc) => ListReportsModel.fromFirestore(doc))
        .toList();
  }

  Future<void> addReport(ListReportsModel report) async {
    await _firestore.collection('reports').add(report.toJson());
  }

  Future<void> deleteReport(String reportId) async {
    await _firestore.collection('reports').doc(reportId).delete();
  }
}
