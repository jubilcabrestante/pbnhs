import 'package:pbnhs/core/models/type/type_model.dart';

abstract class ITypeRepo {
  Future<List<TypeModel>> getTypes();
}
