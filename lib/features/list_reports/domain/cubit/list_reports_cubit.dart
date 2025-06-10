import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbnhs/core/domain/cubit/user_auth_cubit.dart';
import 'package:pbnhs/features/list_reports/domain/cubit/list_reports_state.dart';
import 'package:pbnhs/features/list_reports/repository/model/list_reports_model.dart';
import 'package:pbnhs/features/list_reports/repository/list_report_repo.dart';
import 'dart:developer';
import 'dart:io';

class ListReportsCubit extends Cubit<ListReportsState> {
  final ListReportsRepository _listReportsRepository;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final UserAuthCubit _userAuthCubit;

  ListReportsCubit(this._listReportsRepository, this._userAuthCubit)
      : super(const ListReportsState());

  getReports(String selectedType) async {
    try {
      final currentUser = _userAuthCubit.state.user;
      if (currentUser == null) {
        throw Exception('User is not authenticated or user data is missing.');
      }

      List<ListReportsModel> reports;
      if (currentUser.role == 'admin') {
        reports = await _listReportsRepository.getReportsByCreator(
          type: selectedType,
          createdBy: currentUser.uid,
        );
      } else if (currentUser.role == 'super-admin') {
        reports = await _listReportsRepository.getReport(selectedType);
      } else {
        throw Exception('Unauthorized role: ${currentUser.role}');
      }

      log("current user role: ${currentUser.role}");
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

  Future<Map<String, dynamic>?> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
      withData: true,
    );

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;
      Uint8List? fileBytes;
      String fileName = file.name;

      if (kIsWeb) {
        fileBytes = file.bytes;
        log('Picked file on web: $fileName, bytes length: ${fileBytes?.length}');
      } else {
        log('Picked file on native: $fileName, path: ${file.path}');
        if (file.path != null) {
          fileBytes = await File(file.path!).readAsBytes();
          log('Read bytes length: ${fileBytes.length}');
        } else {
          log('File path is null');
        }
      }

      if (fileBytes != null) {
        return {
          'data': fileBytes,
          'name': fileName,
        };
      } else {
        log('File bytes is null');
      }
    } else {
      log('No file selected or empty file list');
    }
    return null;
  }

  Future<String?> uploadFile(Uint8List fileData, String fileName) async {
    String filePath = 'reports/$fileName';
    try {
      UploadTask uploadTask = _firebaseStorage.ref(filePath).putData(
            fileData,
            SettableMetadata(contentType: _getMimeType(fileName)),
          );

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

  addReport({
    required String title,
    required String type,
    required String createdBy,
    Uint8List? fileData,
    String? fileName,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));
    try {
      String? fileUrl;
      if (fileData != null && fileName != null) {
        fileUrl = await uploadFile(fileData, fileName);
      }
      final report = ListReportsModel(
        id: '',
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

  deleteReport(String reportId, String selectedType) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      await _listReportsRepository.deleteReport(reportId);
      log('Report deleted successfully');
      final updatedReports =
          await _listReportsRepository.getReport(selectedType);
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        reports: updatedReports,
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

  String _getMimeType(String fileName) {
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return 'application/pdf';
      case 'doc':
      case 'docx':
        return 'application/msword';
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      default:
        return 'application/octet-stream';
    }
  }

  updateReport({
    required String reportId,
    required String title,
    required String type,
    Uint8List? fileData,
    String? fileName,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    try {
      String? fileUrl;
      if (fileData != null && fileName != null) {
        fileUrl = await uploadFile(fileData, fileName);
      }

      // Fetch existing report details to retain the createdBy field
      final existingReports = await _listReportsRepository.getReport(type);
      final existingReport = existingReports.firstWhere(
        (report) => report.id == reportId,
        orElse: () => ListReportsModel(
          id: reportId,
          title: title,
          type: type,
          dateUploaded: DateTime.now(),
          createdBy: '', // Fallback (should not be used if report exists)
          link: '',
        ),
      );

      final updatedReport = ListReportsModel(
        id: reportId,
        title: title,
        type: type,
        dateUploaded: DateTime.now(),
        createdBy: existingReport.createdBy, // Preserve the original creator
        link: fileUrl ?? existingReport.link, // Retain old file if no new file
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
}
