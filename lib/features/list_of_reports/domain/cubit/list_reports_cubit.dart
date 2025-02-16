import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/models/type/type_model.dart';
import 'package:pbnhs/features/list_of_reports/domain/cubit/list_reports_state.dart';
import 'package:pbnhs/features/list_of_reports/repository/type_repo.dart';

class ListReportsCubit extends Cubit<ListReportsState> {
  final TypeRepository _typeRepository;

  ListReportsCubit(this._typeRepository) : super(const ListReportsState());

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
