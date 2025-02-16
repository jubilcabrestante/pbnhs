import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pbnhs/core/models/type/type_model.dart';

part 'list_reports_state.freezed.dart';

@freezed
class ListReportsState with _$ListReportsState {
  const factory ListReportsState({
    String? errorMessage,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isRole,
    @Default([]) List<TypeModel> typeModel,
    TypeModel? selectedType,
  }) = _ListReportsState;
}
