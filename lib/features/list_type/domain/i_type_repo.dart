import 'package:pbnhs/features/list_type/repository/type_model/type_vm.dart';

abstract class ITypeRepo {
  Future<List<TypeVm>> getTypes();
}
