import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/features/list_type/repository/type_model/type_model.dart';
import 'package:pbnhs/features/list_type/domain/list_type_cubit/list_type_state.dart';
import 'package:pbnhs/features/list_type/repository/type_repo.dart';

class ListTypeCubit extends Cubit<ListTypeState> {
  final TypeRepository _typeRepository;

  ListTypeCubit(this._typeRepository) : super(const ListTypeState());

  Future<void> fetchTypes() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      List<TypeModel> types = await _typeRepository.getTypes();

      if (types.isNotEmpty) {
        emit(state.copyWith(
          isSuccess: true,
          typeModel: types, // ✅ Store all types
          isLoading: false,
        ));
      } else {
        emit(state.copyWith(errorMessage: 'No types found', isLoading: false));
      }
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Error fetching types: $e',
        isLoading: false,
      ));
    }
  }

  void selectType(TypeModel type) {
    emit(state.copyWith(selectedType: type)); // ✅ Set selected type
  }
}
