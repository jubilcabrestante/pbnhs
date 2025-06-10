import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pbnhs/features/list_type/repository/type_model/type_vm.dart';
import 'package:pbnhs/features/list_type/domain/i_type_repo.dart';

class TypeRepository implements ITypeRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<TypeVm>> getTypes() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('types').get();

      List<TypeVm> typesList = querySnapshot.docs.map((doc) {
        return TypeVm.fromJson(doc.data());
      }).toList();

      return typesList;
    } catch (e) {
      log('❌ Error fetching types: $e');
      return [];
    }
  }
}
