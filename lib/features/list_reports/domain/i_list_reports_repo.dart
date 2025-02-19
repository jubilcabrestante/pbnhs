import 'package:pbnhs/features/list_reports/repository/model/list_reports_model.dart';

abstract class IListReportsRepository {
  Future<List<ListReportsModel>> getReport(String type);

  Future<void> deleteReport(String reportId);

  Future<String> addReport(ListReportsModel report);
}
