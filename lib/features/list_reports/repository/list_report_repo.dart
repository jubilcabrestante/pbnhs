import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception("User not authenticated");

    await _firestore.collection('reports').add({
      ...report.toJson(),
      'adminId': user.uid, // ✅ Ensure userId is stored in Firestore
    });
  }

  Future<void> updateReport(ListReportsModel report) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception("User not authenticated");

    await _firestore.collection('reports').doc(report.id).update({
      ...report.toJson(),
      'adminId': user.uid, // Ensures userId remains consistent
    });
  }

  Future<void> deleteReport(String reportId) async {
    await _firestore.collection('reports').doc(reportId).delete();
  }
}
