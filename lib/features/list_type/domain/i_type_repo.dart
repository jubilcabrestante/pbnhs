import 'package:pbnhs/features/list_type/repository/type_model/type_model.dart';

abstract class ITypeRepo {
  Future<List<TypeModel>> getTypes();
}
