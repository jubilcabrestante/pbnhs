import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/features/list_reports/domain/cubit/list_reports_state.dart';
import 'package:pbnhs/features/list_reports/repository/model/list_reports_model.dart';
import 'package:pbnhs/features/list_reports/repository/list_report_repo.dart';
import 'dart:developer';

class ListReportsCubit extends Cubit<ListReportsState> {
  final ListReportsRepository _listReportsRepository;

  ListReportsCubit(this._listReportsRepository)
      : super(const ListReportsState());

  Future<void> getReports(String selectedType) async {
    log('Fetching reports for type: $selectedType');
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final reports = await _listReportsRepository.getReport(selectedType);
      log('Reports fetched successfully: ${reports.length}');
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        reports: reports,
      ));
    } catch (e) {
      log('Error fetching reports: $e');
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> addReport(ListReportsModel report, String selectedType) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    try {
      await _listReportsRepository.addReport(report);
      final updatedReports =
          await _listReportsRepository.getReport(selectedType);

      emit(state.copyWith(
          isLoading: false, isSuccess: true, reports: updatedReports));
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, isSuccess: false, errorMessage: e.toString()));
    }
  }

  Future<void> deleteReport(String reportId, String selectedType) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      await _listReportsRepository.deleteReport(reportId);
      log('Report deleted successfully');
      emit(state.copyWith(isLoading: false, isSuccess: true));
      await getReports(selectedType); // Refresh reports after deleting
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, isSuccess: false, errorMessage: e.toString()));
    }
  }
}
