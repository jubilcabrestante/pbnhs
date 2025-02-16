import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pbnhs/core/models/type/type_model.dart';
import 'package:pbnhs/features/list_of_reports/domain/i_type_repo.dart';

class TypeRepository implements ITypeRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<TypeModel>> getTypes() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('type').get();

      List<TypeModel> typesList = querySnapshot.docs.map((doc) {
        return TypeModel.fromFirestore(doc);
      }).toList();

      return typesList;
    } catch (e, stackTrace) {
      log('❌ Error fetching types: $e');
      log(stackTrace as String);
      return [];
    }
  }
}
