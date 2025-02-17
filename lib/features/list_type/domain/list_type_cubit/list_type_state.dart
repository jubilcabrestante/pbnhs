import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pbnhs/features/list_type/repository/type_model/type_model.dart';

part 'list_type_state.freezed.dart';

@freezed
class ListTypeState with _$ListTypeState {
  const factory ListTypeState({
    String? errorMessage,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isRole,
    @Default([]) List<TypeModel> typeModel,
    TypeModel? selectedType,
  }) = _ListTypeState;
}
