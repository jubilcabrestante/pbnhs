import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/repository/user_repository.dart';
import 'package:pbnhs/features/list_reports/domain/cubit/list_reports_state.dart';
import 'package:pbnhs/features/list_reports/repository/model/list_reports_model.dart';
import 'package:pbnhs/features/list_reports/repository/list_report_repo.dart';
import 'dart:developer';
import 'dart:io';

import '../../../accounts/repository/user_model/user_model.dart';

class ListReportsCubit extends Cubit<ListReportsState> {
  final ListReportsRepository _listReportsRepository;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final UserAuthRepository _userAuthRepository;

  ListReportsCubit(this._listReportsRepository, this._userAuthRepository)
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

  Future<UserModel?> fetchUserDetails() async {
    try {
      final user = await _userAuthRepository.user.first;
      if (user != null) {
        UserModel userModel =
            await _userAuthRepository.getUserDetails(user.uid);
        log('Username: ${userModel.name}');
        return userModel; // Return the fetched user
      } else {
        log('No user logged in');
        return null;
      }
    } catch (e) {
      log('Error fetching user details: $e');
      return null;
    }
  }

  Future<File?> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      return File(result.files.single.path!);
    }
    return null;
  }

  Future<String?> uploadFile(File file) async {
    String fileName = file.path.split('/').last;
    String filePath = 'reports/$fileName';

    try {
      UploadTask uploadTask = _firebaseStorage.ref(filePath).putFile(file);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      log('File uploaded successfully: $downloadUrl');
      return downloadUrl;
    } catch (e) {
      log('File upload error: $e');
      emit(state.copyWith(errorMessage: 'File upload failed'));
      return null;
    }
  }

  Future<void> addReport({
    required String title,
    required String type,
    required String createdBy,
    File? file,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    try {
      String? fileUrl;
      if (file != null) {
        fileUrl = await uploadFile(file);
      }

      final report = ListReportsModel(
        id: '', // ✅ Generate ID inside Cubit
        title: title,
        type: type,
        dateUploaded: DateTime.now(),
        createdBy: createdBy,
        link: fileUrl ?? '',
      );

      await _listReportsRepository.addReport(report);
      final updatedReports = await _listReportsRepository.getReport(type);

      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        reports: updatedReports,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> updateReport({
    required String reportId,
    required String title,
    required String type,
    File? file,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    try {
      String? fileUrl;
      if (file != null) {
        fileUrl = await uploadFile(file);
      }

      final updatedReport = ListReportsModel(
        id: reportId,
        title: title,
        type: type,
        dateUploaded: DateTime.now(),
        createdBy: '', // Keep previous createdBy
        link: fileUrl ?? '',
      );

      await _listReportsRepository.updateReport(updatedReport);
      final updatedReports = await _listReportsRepository.getReport(type);

      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        reports: updatedReports,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> deleteReport(String reportId, String selectedType) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      await _listReportsRepository.deleteReport(reportId);
      log('Report deleted successfully');

      final updatedReports =
          await _listReportsRepository.getReport(selectedType);

      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        reports: updatedReports, // ✅ Ensure updated reports are emitted
      ));
    } catch (e) {
      log('Error deleting report: $e');
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: e.toString(),
      ));
    }
  }
}
