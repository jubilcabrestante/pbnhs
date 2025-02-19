import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pbnhs/features/list_reports/repository/model/list_reports_model.dart';

part 'list_reports_state.freezed.dart';

@freezed
class ListReportsState with _$ListReportsState {
  const factory ListReportsState(
      {@Default(false) bool isLoading,
      @Default(false) bool isSuccess,
      String? errorMessage,
      List<ListReportsModel>? reports}) = _ListReportsState;
}
